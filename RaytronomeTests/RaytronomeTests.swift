//
//  RaytronomeTests.swift
//  RaytronomeTests
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import Raytronome

class RaytronomeTests: XCTestCase {
    var viewModel: MetronomeViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUp() {
        viewModel = MetronomeViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    func testNumeratorStartsAt4() throws {
        XCTAssertEqual(try viewModel.numeratorText.toBlocking().first(), "4")
        XCTAssertEqual(try viewModel.numeratorValue.toBlocking().first(), 4)
    }
    
    func testDenominatorStartsAt4() throws {
        XCTAssertEqual(try viewModel.denominatorText.toBlocking().first(), "4")
    }
    
    func testSignatureStartsAt4By4() throws {
        XCTAssertEqual(try viewModel.signatureText.toBlocking().first(), "4/4")
    }
    
    func testTempoStartsAt120() throws {
        XCTAssertEqual(try viewModel.tempo.toBlocking().first(), 120)
    }
    
    func testTappedPlayPauseChangesIsPlaying() throws {
        let isPlaying = scheduler.createObserver(Bool.self)
        
        viewModel.isPlaying
        .drive(isPlaying)
        .disposed(by: disposeBag)
        
        scheduler.createColdObservable([.next(10, ()),
                                        .next(20, ()),
                                        .next(30, ())
        ])
            
            .bind(to: viewModel.tappedPlayPause)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        XCTAssertEqual(isPlaying.events, [
            .next(0, false),
            .next(10, true),
            .next(20, false),
            .next(30, true)
        ])
    }
    
    
    
}
