//
//  SplashVC.m
//  DatingApp
//
//  Created by Lubhna Shirvastava on 09/05/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "SplashVC.h"

@interface SplashVC ()

@end

@implementation SplashVC

- (void)viewDidLoad
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    changeLanguage = NO;
    [super viewDidLoad];
    tempArray = [[NSMutableArray alloc]init];
    [self forRandomgeneration];
    
    [self setContentViewFrames];
    
    timerSplash = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(cancelsplash) userInfo:nil repeats:NO];
    
    //[self moveToHomeScreen];
    
    // Do any additional setup after loading the view.
}
#pragma mark - setFrames
-(void)setContentViewFrames
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    if (IS_IPHONE_4)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone4BackgroundImage]];
    }
    else if (IS_IPHONE_5 || IS_IPHONE_6)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6BackgroundImage]];
    }
    else if (IS_IPHONE_6plus)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6PlusBackgroundImage]];
    }
    else
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6PlusBackgroundImage]];
    }
    arrRandomtext = [NSMutableArray arrayWithObjects:@"Si cocinas como caminas me como hasta la raspita",
                     @"Mami, si San Lazaro te ve, suelta las muletas y sale corriendo",
                     @"Verdad que el perfume bueno viene en frasco chiquito",
                     @"Niña, si la te coge te pone una multa por extra carne en el maletero",
                     @"Cariño camina por la sombrita que en el sol se derriten los bombones",
                     @"¿Crees en el amor a primera vista o tengo que pasar de nuevo?",
                     @"Papi estas como el morro, viejo pero interesante",
                     @"Dios te guarde, y me de la llave a mi",
                     @"Señora vaya con Dios, que yo voy con su hija",
                     @"Si la belleza fuera pecado usted jamas iria al ciel",
                     @"¡Le ronca al mango mama! tu con tanta carne y yo pasando hambre",
                     @"Mima me tienes como carrito de helado, vacio y loma abajo",
                     @"Tu con tantas curvas y yo sin frenos",
                     @"Linda estas como la langosta cola na'ma",
                     @"Mamita estas como Santa Barbara, santa por delante y barbara por detras",
                     @"Niña, estas como la quincallita, chiquitica pero bien surtidita",
                     @"¡Niña! estas como me la receto el medico",
                     @"Hay Cubanas tan monumentales que merecen ser declaradas patrimonio nacional",
                     @"Eres tan dulce, que solo con mirarte engordo",
                     @"Desde que vi tus ojos verdes me he hecho ecologista",
                     @"Muñeca por alguna casualidad ese pantalon es capitalista, porque llevas las masas oprimidas",
                     @"Chiquita que linda eres con tus ojos de azabache estoy metido contigo como un camion en un bache",
                     @"Nina,estas como la quincallita,chiquitica pero bien surtidita",
                     @"Niña: estas como la caña de mayo... lista para meterle el machete",
                     @"Cuidado muñeca si sigues tirando tantas curvas te vas a descarrilar",
                     @"¿De donde tu saliste muñeca, del museo de bellas artes?",
                     @"Mami, estas como agua para chocolate",
                     @"Quisiera ser el berraco que goza en el corral de tu corazon",
                     @"Mi amor, cuando se te maduren los ojos me puedes regalar uno",
                     @"Bendito el tornero que hizo tus curvas",
                     @"Las tres mariposas, la de el medio es una rosa",
                     @"Mucho balcon para tan poca terraza",
                     @"¡Esa si es mujer, no la que tengo en casa!",
                     @"...y dicen que en cuba no hay carne, lo que no hay es lata pa´ envasarla!",
                     @"Estas como la historia de Cuba, vieja pero interesante",
                     @"Si tu caminas como cocinas me comeria hasta el pegao",
                     @"Como avanza la tecnologia... porque hasta las flores caminan!",
                     @"Si el mundo fuera un pañuelo... serias mi moco preferido.",
                     @"Hoy dormiras con los angeles y soñaras conmigo. Un dia dormiras conmigo y soñaras con los angeles",
                     @"Tu madre ha de ser pastelera, porque un bombon como tu no lo hace cualquiera.",
                     @"Si tus labios fuesen leche y los mios arroz... que festin de arroz con leche nos dariamos tu y yo.",
                     @"Si fuera camionero te llevaria en mi camion pero como no lo soy te llevo en el corazon.",
                     @"Si tus piernas son las vias, ¡como sera la estacion!", nil];
    int yy = 100;
    
    UIImageView *imgLogo=[[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(182/2), yy, 182, 132)];
    imgLogo.image = [UIImage imageNamed:@"splash_logo.png"];
    //imgLogo.backgroundColor = [UIColor redColor];
    imgLogo.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgLogo];
    
    yy = yy + imgLogo.frame.size.height+30;
    
    UILabel * lblRandom = [[UILabel alloc]initWithFrame:CGRectMake(10, yy, DEVICE_WIDTH-20, 200)];
    
    lblRandom.textColor = [UIColor blackColor];
    lblRandom.text = @"";
    lblRandom.textAlignment = NSTextAlignmentCenter;
    lblRandom.numberOfLines = 0;
    lblRandom.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:lblRandom];
    
    
    if ([arrRandomtext count]>0) {
       
        int index = arc4random() % [arrRandomtext count];
        
        lblRandom.text = [arrRandomtext objectAtIndex:index];
    }
    
}
-(void)forRandomgeneration
{
    NSInteger randomNumber = arc4random() % 8;
    
    NSLog(@"aRandomNumber is %ld", (long)randomNumber);
    
    NSString * strImg;
    
    //    NSLog(@"strimg==> %@",strImg);
    
    if (IS_IPHONE_4)
    {
        strImg = [NSString stringWithFormat:@"background-%ld_4.png",(long)randomNumber];
    }
    else if (IS_IPHONE_5)
    {
        strImg = [NSString stringWithFormat:@"background-%ld_5.png",(long)randomNumber];
    }
    else if (IS_IPHONE_6)
    {
        strImg = [NSString stringWithFormat:@"background-%ld_6.png",(long)randomNumber];
    }
    else if (IS_IPHONE_6plus)
    {
        strImg = [NSString stringWithFormat:@"background-%ld_6+.png",(long)randomNumber];
    }
    else{
        strImg = [NSString stringWithFormat:@"background-%ld_6+.png",(long)randomNumber];
        
    }
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:strImg forKey:@"backGroundimage"];
    [userDefault synchronize];
}

-(void) cancelsplash
{
    if(splashScreen)
    {
        [splashScreen.view removeFromSuperview];
        splashScreen = nil;
    }
    
    [appDelegate.window addSubview:splashScreen.view];
    
    appDelegate.window.rootViewController = nil;
    
    [self moveToHomeScreen];
    
}
-(void)moveToHomeScreen
{
    // Checking user logged in or not
    NSLog(@"userToken==%@",CURRENT_USER_ACCESS_TOKEN);
    [[NSBundle mainBundle] preferredLocalizations];
    NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSLog(@"language==>%@",languageSyatem);

    if([CURRENT_USER_LANGUAGE isEqual:[NSNull null]] || [CURRENT_USER_LANGUAGE isEqualToString:@""] || CURRENT_USER_LANGUAGE == nil || [CURRENT_USER_LANGUAGE isEqualToString:@"(null)"])
    {
        if ([languageSyatem isEqualToString:@"es"]) {
            [TSLanguageManager setSelectedLanguage:kLMSpanish];
        }
        else{
            [TSLanguageManager setSelectedLanguage:kLMEnglish];
         }
    }else{
        if ([languageSyatem isEqualToString:@"es"]) {
            [TSLanguageManager setSelectedLanguage:kLMSpanish];
        }
        else{
            [TSLanguageManager setSelectedLanguage:kLMEnglish];
        }
    }

    NSUserDefaults * UserdefsultsAppRating = [NSUserDefaults standardUserDefaults];
    // getting an NSString
    isForRating = [UserdefsultsAppRating valueForKey:@"APP_RATING_FOR"];
    
    if (isForRating==nil || [isForRating isEqualToString:@""] || [isForRating isEqual:[NSNull null] ]) {
        
        isForRating = @"NO";
        
        [UserdefsultsAppRating setValue:isForRating forKey:@"APP_RATING_FOR"];
        
    }
    
    
    if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
    {
        ValidateEmailVC * splash = [[ValidateEmailVC alloc] init];
        UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
        navControl.navigationBarHidden=YES;
        
        appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        appDelegate.window.rootViewController = navControl;
    }
   else
   {    [self callWebapiForLanguage];
       [self upDatewebserviceCalling];
       [APP_DELEGATE setUpTabBarController:@"NO"];
       
   }
}
#pragma mark - WebserviceCalling
-(void)callWebapiForLanguage {
    NSString * webServiceName = @"run/api";
    
    // Checking user logged in or not
    NSLog(@"userToken==%@",CURRENT_USER_ACCESS_TOKEN);
    [[NSBundle mainBundle] preferredLocalizations];
    NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSString * strLang = @"";
    NSLog(@"language==>%@",languageSyatem);
 if ([languageSyatem isEqualToString:@"es"]) {
     strLang= @"es";
     
 }else{
     strLang= @"en";
 }
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    NSString * strLangusgae = [NSString stringWithFormat:@"perfil LANG %@",strLang];
    
    [parameter_dict setObject:strLangusgae forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"Languagechange";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}
-(void)upDatewebserviceCalling
{
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:@"piropazo profile" forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"GettingPeopels";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    [APP_DELEGATE endHudProcess];
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"GettingPeopels"])
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            
            if([[result valueForKey:@"result"] valueForKey:@"profile"])
            {
                NSMutableDictionary * dicDetails = [[NSMutableDictionary alloc]init];
                
                if ([[result valueForKey:@"result"] valueForKey:@"profile"]!=nil && [[result valueForKey:@"result"] valueForKey:@"profile"]!=[NSNull null]) {
                    dicDetails = [[result valueForKey:@"result"] valueForKey:@"profile"];
                }
                
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                
                NSString * strGender = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"gender"]];
                
                NSString * strImage = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"picture_public"]];
                
                NSString * strUserName = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"username"]];
                
                if (strUserName!=nil && ![strUserName isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strUserName forKey:@"CURRENT_USER_FIRST_NAME"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"CURRENT_USER_FIRST_NAME"];
                }
                
                
                if (strGender!=nil && ![strGender isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strGender forKey:@"GENDER_STATUS"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"GENDER_STATUS"];
                }
                
                if (strImage!=nil && ![strImage isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strImage forKey:@"USER_IMAGE"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"USER_IMAGE"];
                }
                
                [userDefaults synchronize];
            }
        }else if ([[result valueForKey:@"commandName"] isEqualToString:@"Languagechange"]){
            
        }
}

- (void)onError:(NSError *)error
{
    [APP_DELEGATE endHudProcess];
    NSLog(@"The error is...%@", error);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
