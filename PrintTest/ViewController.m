//
//  ViewController.m
//  PrintTest
//
//  Created by Ben Askren on 12/10/19.
//  Copyright © 2019 baskren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *PrintButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction) Print:(id)sender
{
    UIPrintInteractionController *controller = [UIPrintInteractionController sharedPrintController];
    if(!controller){
        NSLog(@"Couldn't get shared UIPrintInteractionController!");
        return;
    }
    controller.printFormatter = [[UIMarkupTextPrintFormatter alloc] initWithMarkupText:@"<!DOCTYPE html PUBLIC\" -//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv =\"Content-Type\" content=\"text/html;charset=utf-8\"/><title>SpanCalc</title></head><body style=\"margin-right:5%;font-family:Arial, Helvetica\"><H3>SpanCalc</H3><span style=\"padding-bottom:10px\"><table style=\"border:2px solid;border-collapse:collapse\"><tr><td style=\"border:1px solid;padding-left:5px;padding-right:5px;\"><H3>Floor Layer</H3><span style=\"padding-bottom:10px\"><table style=\"border:2px solid;border-collapse:collapse\"><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Floor Covering:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">Cushioned Vinyl</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Gypsym Concrete Topped:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">False</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Subfloor:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">1 Layer ²³/₃₂\" OSB</td></tr></table></td></tr></table></span></td></tr><tr><td style=\"border:1px solid;padding-left:5px;padding-right:5px;\"><H3>Framing</H3><span style=\"padding-bottom:10px\"><table style=\"border:2px solid;border-collapse:collapse\"><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Framing:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">I-Joists</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>On Center Spacing:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">@24\"o.c.</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Joist Depth:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">&lt; 14\" I-joists</td></tr></table></td></tr></table></span></td></tr><tr><td style=\"border:1px solid;padding-left:5px;padding-right:5px;\"><H3>Ceiling Layer</H3><span style=\"padding-bottom:10px\"><table style=\"border:2px solid;border-collapse:collapse\"><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Subfloor:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">2 Layers ¹/₂\" GWB</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Resilient Channel Spacing:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">@16\"o.c.</td></tr></table></td></tr><tr><td style=\"background-color:rgba(0,0,0,0.1);border-top:1px solid\"><table width=100% style=\"table-layout:fixed\"><tr><td>Insulation:</td></tr><tr><td align=\"right\" style=\"padding-right:5px;\">3.5\" Fiberglass Batt</td></tr></table></td></tr></table></span></td></tr></table></span></body></html>"];
    
    
    UIPrintInteractionCompletionHandler completionHandler =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if(!completed && error){
            NSLog(@"FAILED! due to error in domain %@ with error code %ld", error.domain, (long)error.code);
        }
    };

    
    
    // Obtain a printInfo so that we can set our printing defaults.
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    // This application produces General content that contains color.
    printInfo.outputType = UIPrintInfoOutputGeneral;
    // We'll use the URL as the job name.
    printInfo.jobName = @"PRINT TEST";
    // Set duplex so that it is available if the printer supports it. We are
    // performing portrait printing so we want to duplex along the long edge.
    printInfo.duplex = UIPrintInfoDuplexNone;
    // Use this printInfo for this print job.
    controller.printInfo = printInfo;
    
    [controller presentAnimated:YES completionHandler:completionHandler];  // iPhone
    
}

@end
