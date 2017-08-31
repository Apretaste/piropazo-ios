//
//  EditProfileVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "EditProfileVC.h"

@interface EditProfileVC ()

@end

@implementation EditProfileVC

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    arrInterstSelection = [[NSMutableArray alloc] init];
    isShow = NO;
    ImageSelected = NO;
    [self setFrame];
    [self SetNavigationbar];

  //========================= SexArray =======================//
    arrSex = [[NSMutableArray alloc]init];
    NSMutableDictionary * dicMale = [[NSMutableDictionary alloc]init];
    [dicMale setObject:@"Male" forKey:@"English_name"];
    [dicMale setObject:@"Masculino" forKey:@"Spanish_name"];
    [dicMale setObject:@"MASCULINO" forKey:@"KeyWord"];

    NSMutableDictionary * dicFemale = [[NSMutableDictionary alloc]init];
    [dicFemale setObject:@"Female" forKey:@"English_name"];
    [dicFemale setObject:@"Femenino" forKey:@"Spanish_name"];
    [dicFemale setObject:@"FEMENINO" forKey:@"KeyWord"];
    
    [arrSex addObject:dicMale];
    [arrSex addObject:dicFemale];
 //===========================================================//
    
 //========================= SexOrientation =======================//

    arrGendorOreintation = [[NSMutableArray alloc]init];
    NSMutableDictionary * dicStright = [[NSMutableDictionary alloc]init];
    [dicStright setObject:@"Straight" forKey:@"English_name"];
    [dicStright setObject:@"Hetero" forKey:@"Spanish_name"];
    [dicStright setObject:@"HETERO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGay = [[NSMutableDictionary alloc]init];
    [dicGay setObject:@"Gay" forKey:@"English_name"];
    [dicGay setObject:@"Gay" forKey:@"Spanish_name"];
    [dicGay setObject:@"HOMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBisexual = [[NSMutableDictionary alloc]init];
    [dicBisexual setObject:@"Bisexual" forKey:@"English_name"];
    [dicBisexual setObject:@"Bisexual" forKey:@"Spanish_name"];
    [dicBisexual setObject:@"BI" forKey:@"KeyWord"];
    [arrGendorOreintation addObject:dicStright];
    [arrGendorOreintation addObject:dicGay];
    [arrGendorOreintation addObject:dicBisexual];

 //===========================================================//
   
 //============================== BodyType ========================//
    arrBody = [[NSMutableArray alloc]init];
    NSMutableDictionary * dicSlim = [[NSMutableDictionary alloc]init];
    [dicSlim setObject:@"Slim" forKey:@"English_name"];
    [dicSlim setObject:@"Delgado" forKey:@"Spanish_name"];
    [dicSlim setObject:@"DELGADO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicAverage = [[NSMutableDictionary alloc]init];
    [dicAverage setObject:@"Average" forKey:@"English_name"];
    [dicAverage setObject:@"Medio" forKey:@"Spanish_name"];
    [dicAverage setObject:@"MEDIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicExtra = [[NSMutableDictionary alloc]init];
    [dicExtra setObject:@"Extra" forKey:@"English_name"];
    [dicExtra setObject:@"Extra" forKey:@"Spanish_name"];
    [dicExtra setObject:@"EXTRA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicAthletic = [[NSMutableDictionary alloc]init];
    [dicAthletic setObject:@"Athletic" forKey:@"English_name"];
    [dicAthletic setObject:@"Atlético" forKey:@"Spanish_name"];
    [dicAthletic setObject:@"ATLETICO" forKey:@"KeyWord"];
    
    [arrBody addObject:dicSlim];
    [arrBody addObject:dicAverage];
    [arrBody addObject:dicExtra];
    [arrBody addObject:dicAthletic];

    //===========================================================//
  
    //============================== Eyes ========================//
    arrEyes = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicBlack = [[NSMutableDictionary alloc]init];
    [dicBlack setObject:@"Black" forKey:@"English_name"];
    [dicBlack setObject:@"Negros" forKey:@"Spanish_name"];
    [dicBlack setObject:@"NEGRO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCarmelite = [[NSMutableDictionary alloc]init];
    [dicCarmelite setObject:@"Carmelite" forKey:@"English_name"];
    [dicCarmelite setObject:@"Carmelitas" forKey:@"Spanish_name"];
    [dicCarmelite setObject:@"CARMELITA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGreen = [[NSMutableDictionary alloc]init];
    [dicGreen setObject:@"Green" forKey:@"English_name"];
    [dicGreen setObject:@"Verdes" forKey:@"Spanish_name"];
    [dicGreen setObject:@"VERDE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBlue = [[NSMutableDictionary alloc]init];
    [dicBlue setObject:@"Blue" forKey:@"English_name"];
    [dicBlue setObject:@"Azules" forKey:@"Spanish_name"];
    [dicBlue setObject:@"AZULE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicHazelnut = [[NSMutableDictionary alloc]init];
    [dicHazelnut setObject:@"Hazelnut" forKey:@"English_name"];
    [dicHazelnut setObject:@"Avellana" forKey:@"Spanish_name"];
    [dicHazelnut setObject:@"AVELLANA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther = [[NSMutableDictionary alloc]init];
    [dicOther setObject:@"Other" forKey:@"English_name"];
    [dicOther setObject:@"Otro" forKey:@"Spanish_name"];
    [dicOther setObject:@"OTRO" forKey:@"KeyWord"];
    
    [arrEyes addObject:dicBlack];
    [arrEyes addObject:dicCarmelite];
    [arrEyes addObject:dicGreen];
    [arrEyes addObject:dicBlue];
    [arrEyes addObject:dicHazelnut];
    [arrEyes addObject:dicOther];

    //===========================================================//

    //============================== Hair ========================//
    arrHair = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicBrunette = [[NSMutableDictionary alloc]init];
    [dicBrunette setObject:@"Brunette" forKey:@"English_name"];
    [dicBrunette setObject:@"Trigueño" forKey:@"Spanish_name"];
    [dicBrunette setObject:@"TRIGUENO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBrown = [[NSMutableDictionary alloc]init];
    [dicBrown setObject:@"Brown" forKey:@"English_name"];
    [dicBrown setObject:@"Castaño" forKey:@"Spanish_name"];
    [dicBrown setObject:@"CASTANO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBlonde = [[NSMutableDictionary alloc]init];
    [dicBlonde setObject:@"Blonde" forKey:@"English_name"];
    [dicBlonde setObject:@"Rubio" forKey:@"Spanish_name"];
    [dicBlonde setObject:@"RUBIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBlack1 = [[NSMutableDictionary alloc]init];
    [dicBlack1 setObject:@"Black" forKey:@"English_name"];
    [dicBlack1 setObject:@"Negro" forKey:@"Spanish_name"];
    [dicBlack1 setObject:@"NEGRO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicRed = [[NSMutableDictionary alloc]init];
    [dicRed setObject:@"Red" forKey:@"English_name"];
    [dicRed setObject:@"Rojo" forKey:@"Spanish_name"];
    [dicRed setObject:@"ROJO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicWhite = [[NSMutableDictionary alloc]init];
    [dicWhite setObject:@"White" forKey:@"English_name"];
    [dicWhite setObject:@"Blanco" forKey:@"Spanish_name"];
    [dicWhite setObject:@"BLANCO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther1 = [[NSMutableDictionary alloc]init];
    [dicOther1 setObject:@"Other" forKey:@"English_name"];
    [dicOther1 setObject:@"Otro" forKey:@"Spanish_name"];
    [dicOther1 setObject:@"OTRO" forKey:@"KeyWord"];
    
    [arrHair addObject:dicBrunette];
    [arrHair addObject:dicBrown];
    [arrHair addObject:dicBlonde];
    [arrHair addObject:dicBlack1];
    [arrHair addObject:dicRed];
    [arrHair addObject:dicWhite];
    [arrHair addObject:dicOther1];

    //===========================================================//
    
    //============================== Skin ========================//
    arrSkin = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicWhite1 = [[NSMutableDictionary alloc]init];
    [dicWhite1 setObject:@"White" forKey:@"English_name"];
    [dicWhite1 setObject:@"Blanca" forKey:@"Spanish_name"];
    [dicWhite1 setObject:@"BLANCO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBlack2 = [[NSMutableDictionary alloc]init];
    [dicBlack2 setObject:@"Black" forKey:@"English_name"];
    [dicBlack2 setObject:@"Negra" forKey:@"Spanish_name"];
    [dicBlack2 setObject:@"NEGRO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMixed = [[NSMutableDictionary alloc]init];
    [dicMixed setObject:@"Mixed" forKey:@"English_name"];
    [dicMixed setObject:@"Mestiza" forKey:@"Spanish_name"];
    [dicMixed setObject:@"MESTIZO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther2 = [[NSMutableDictionary alloc]init];
    [dicOther2 setObject:@"Other" forKey:@"English_name"];
    [dicOther2 setObject:@"Otro" forKey:@"Spanish_name"];
    [dicOther2 setObject:@"OTRO" forKey:@"KeyWord"];
    
    [arrSkin addObject:dicWhite1];
    [arrSkin addObject:dicBlack2];
    [arrSkin addObject:dicMixed];
    [arrSkin addObject:dicOther2];
    
    //===========================================================//
    //============================== Civil Status ========================//
    arrCivilStatus = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicSingle = [[NSMutableDictionary alloc]init];
    [dicSingle setObject:@"Single" forKey:@"English_name"];
    [dicSingle setObject:@"Soltero" forKey:@"Spanish_name"];
    [dicSingle setObject:@"SOLTERO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicDating = [[NSMutableDictionary alloc]init];
    [dicDating setObject:@"Dating" forKey:@"English_name"];
    [dicDating setObject:@"Saliendo" forKey:@"Spanish_name"];
    [dicDating setObject:@"SALIENDO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicEngaged = [[NSMutableDictionary alloc]init];
    [dicEngaged setObject:@"Engaged" forKey:@"English_name"];
    [dicEngaged setObject:@"Comprometido" forKey:@"Spanish_name"];
    [dicEngaged setObject:@"COMPROMETIDO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMarried = [[NSMutableDictionary alloc]init];
    [dicMarried setObject:@"Married" forKey:@"English_name"];
    [dicMarried setObject:@"Casado" forKey:@"Spanish_name"];
    [dicMarried setObject:@"CASADO" forKey:@"KeyWord"];
    
    [arrCivilStatus addObject:dicSingle];
    [arrCivilStatus addObject:dicDating];
    [arrCivilStatus addObject:dicEngaged];
    [arrCivilStatus addObject:dicMarried];
    
    //===========================================================//
    
    //============================== School Status ========================//
    arrSchool = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicElementary = [[NSMutableDictionary alloc]init];
    [dicElementary setObject:@"Elementary" forKey:@"English_name"];
    [dicElementary setObject:@"Primaria" forKey:@"Spanish_name"];
    [dicElementary setObject:@"PRIMARIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicHighSchool = [[NSMutableDictionary alloc]init];
    [dicHighSchool setObject:@"High School" forKey:@"English_name"];
    [dicHighSchool setObject:@"Secundaria" forKey:@"Spanish_name"];
    [dicHighSchool setObject:@"SECUNDARIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicAssociate = [[NSMutableDictionary alloc]init];
    [dicAssociate setObject:@"Associate" forKey:@"English_name"];
    [dicAssociate setObject:@"Técnico" forKey:@"Spanish_name"];
    [dicAssociate setObject:@"TECNICO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicUniversity = [[NSMutableDictionary alloc]init];
    [dicUniversity setObject:@"University" forKey:@"English_name"];
    [dicUniversity setObject:@"Universitario" forKey:@"Spanish_name"];
    [dicUniversity setObject:@"UNIVERSITARIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMasters = [[NSMutableDictionary alloc]init];
    [dicMasters setObject:@"Masters" forKey:@"English_name"];
    [dicMasters setObject:@"Postgraduado" forKey:@"Spanish_name"];
    [dicMasters setObject:@"POSTGRADUADO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicPhD = [[NSMutableDictionary alloc]init];
    [dicPhD setObject:@"PhD" forKey:@"English_name"];
    [dicPhD setObject:@"Doctorado" forKey:@"Spanish_name"];
    [dicPhD setObject:@"DOCTORADO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther3 = [[NSMutableDictionary alloc]init];
    [dicOther3 setObject:@"Other" forKey:@"English_name"];
    [dicOther3 setObject:@"Otro" forKey:@"Spanish_name"];
    [dicOther3 setObject:@"OTRO" forKey:@"KeyWord"];
    
    [arrSchool addObject:dicElementary];
    [arrSchool addObject:dicHighSchool];
    [arrSchool addObject:dicAssociate];
    [arrSchool addObject:dicUniversity];
    [arrSchool addObject:dicMasters];
    [arrSchool addObject:dicPhD];
    [arrSchool addObject:dicOther3];

    //===========================================================//

    //============================== Country ========================//
    arrCountry = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicCuba = [[NSMutableDictionary alloc]init];
    [dicCuba setObject:@"Cuba" forKey:@"English_name"];
    [dicCuba setObject:@"Cuba" forKey:@"Spanish_name"];
    [dicCuba setObject:@"CU" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicus = [[NSMutableDictionary alloc]init];
    [dicus setObject:@"U.S.A" forKey:@"English_name"];
    [dicus setObject:@"Estados Unidos" forKey:@"Spanish_name"];
    [dicus setObject:@"US" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSpain = [[NSMutableDictionary alloc]init];
    [dicSpain setObject:@"Spain" forKey:@"English_name"];
    [dicSpain setObject:@"España" forKey:@"Spanish_name"];
    [dicSpain setObject:@"ES" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicFrance = [[NSMutableDictionary alloc]init];
    [dicFrance setObject:@"France" forKey:@"English_name"];
    [dicFrance setObject:@"Francia" forKey:@"Spanish_name"];
    [dicFrance setObject:@"FR" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGermany = [[NSMutableDictionary alloc]init];
    [dicGermany setObject:@"Germany" forKey:@"English_name"];
    [dicGermany setObject:@"Alemania" forKey:@"Spanish_name"];
    [dicGermany setObject:@"DE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicVenezuela = [[NSMutableDictionary alloc]init];
    [dicVenezuela setObject:@"Venezuela" forKey:@"English_name"];
    [dicVenezuela setObject:@"Venezuela" forKey:@"Spanish_name"];
    [dicVenezuela setObject:@"VE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicItaly = [[NSMutableDictionary alloc]init];
    [dicItaly setObject:@"Italy" forKey:@"English_name"];
    [dicItaly setObject:@"Italia" forKey:@"Spanish_name"];
    [dicItaly setObject:@"IT" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMexico = [[NSMutableDictionary alloc]init];
    [dicMexico setObject:@"Mexico" forKey:@"English_name"];
    [dicMexico setObject:@"México" forKey:@"Spanish_name"];
    [dicMexico setObject:@"MX" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCanada = [[NSMutableDictionary alloc]init];
    [dicCanada setObject:@"Canada" forKey:@"English_name"];
    [dicCanada setObject:@"Canada" forKey:@"Spanish_name"];
    [dicCanada setObject:@"CA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther4 = [[NSMutableDictionary alloc]init];
    [dicOther4 setObject:@"Other" forKey:@"English_name"];
    [dicOther4 setObject:@"Otro" forKey:@"Spanish_name"];
    [dicOther4 setObject:@"OTRO" forKey:@"KeyWord"];
    
    [arrCountry addObject:dicCuba];
    [arrCountry addObject:dicus];
    [arrCountry addObject:dicSpain];
    [arrCountry addObject:dicFrance];
    [arrCountry addObject:dicGermany];
    [arrCountry addObject:dicVenezuela];
    [arrCountry addObject:dicItaly];
    [arrCountry addObject:dicMexico];
    [arrCountry addObject:dicCanada];
    [arrCountry addObject:dicOther4];
    
    //===========================================================//
    
    //============================== Province ========================//
    arrProvience = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicPinar = [[NSMutableDictionary alloc]init];
    [dicPinar setObject:@"Pinar del Río" forKey:@"English_name"];
    [dicPinar setObject:@"Pinar del Río" forKey:@"Spanish_name"];
    [dicPinar setObject:@"PINAR_DEL_RIO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicHabana = [[NSMutableDictionary alloc]init];
    [dicHabana setObject:@"La Habana" forKey:@"English_name"];
    [dicHabana setObject:@"La Habana" forKey:@"Spanish_name"];
    [dicHabana setObject:@"LA_HABANA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicArtemisa = [[NSMutableDictionary alloc]init];
    [dicArtemisa setObject:@"Artemisa" forKey:@"English_name"];
    [dicArtemisa setObject:@"Artemisa" forKey:@"Spanish_name"];
    [dicArtemisa setObject:@"ARTEMISA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMayabeque = [[NSMutableDictionary alloc]init];
    [dicMayabeque setObject:@"Mayabeque" forKey:@"English_name"];
    [dicMayabeque setObject:@"Mayabeque" forKey:@"Spanish_name"];
    [dicMayabeque setObject:@"MAYABEQUE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMatanzas = [[NSMutableDictionary alloc]init];
    [dicMatanzas setObject:@"Matanzas" forKey:@"English_name"];
    [dicMatanzas setObject:@"Matanzas" forKey:@"Spanish_name"];
    [dicMatanzas setObject:@"MATANZAS" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicVillas = [[NSMutableDictionary alloc]init];
    [dicVillas setObject:@"Las Villas" forKey:@"English_name"];
    [dicVillas setObject:@"Las Villas" forKey:@"Spanish_name"];
    [dicVillas setObject:@"VILLAS_CLARA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCienfuegos = [[NSMutableDictionary alloc]init];
    [dicCienfuegos setObject:@"Cienfuegos" forKey:@"English_name"];
    [dicCienfuegos setObject:@"Cienfuegos" forKey:@"Spanish_name"];
    [dicCienfuegos setObject:@"CIENFUEGOS" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSpiritus = [[NSMutableDictionary alloc]init];
    [dicSpiritus setObject:@"Sancti Spíritus" forKey:@"English_name"];
    [dicSpiritus setObject:@"Sancti Spíritus" forKey:@"Spanish_name"];
    [dicSpiritus setObject:@"SANCTI_SPIRITUS" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCiego = [[NSMutableDictionary alloc]init];
    [dicCiego setObject:@"Ciego" forKey:@"English_name"];
    [dicCiego setObject:@"Ciego" forKey:@"Spanish_name"];
    [dicCiego setObject:@"CIEGO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCamag = [[NSMutableDictionary alloc]init];
    [dicCamag setObject:@"Camagüey" forKey:@"English_name"];
    [dicCamag setObject:@"Camagüey" forKey:@"Spanish_name"];
    [dicCamag setObject:@"CAMAGUEY" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicLas = [[NSMutableDictionary alloc]init];
    [dicLas setObject:@"Las Tunas" forKey:@"English_name"];
    [dicLas setObject:@"Las Tunas" forKey:@"Spanish_name"];
    [dicLas setObject:@"LAS_TUNAS" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicHolg = [[NSMutableDictionary alloc]init];
    [dicHolg setObject:@"Holguín" forKey:@"English_name"];
    [dicHolg setObject:@"Holguín" forKey:@"Spanish_name"];
    [dicHolg setObject:@"HOLGUIN" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGranma = [[NSMutableDictionary alloc]init];
    [dicGranma setObject:@"Granma" forKey:@"English_name"];
    [dicGranma setObject:@"Granma" forKey:@"Spanish_name"];
    [dicGranma setObject:@"GRANMA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSantiago = [[NSMutableDictionary alloc]init];
    [dicSantiago setObject:@"Santiago" forKey:@"English_name"];
    [dicSantiago setObject:@"Santiago" forKey:@"Spanish_name"];
    [dicSantiago setObject:@"SANTIAGO_DE_CUBA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGuan = [[NSMutableDictionary alloc]init];
    [dicGuan setObject:@"Guantánamo" forKey:@"English_name"];
    [dicGuan setObject:@"Guantánamo" forKey:@"Spanish_name"];
    [dicGuan setObject:@"GUANTANAMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIsla = [[NSMutableDictionary alloc]init];
    [dicIsla setObject:@"Isla de la Juventud" forKey:@"English_name"];
    [dicIsla setObject:@"Isla de la Juventud" forKey:@"Spanish_name"];
    [dicIsla setObject:@"ISLA_DE_LA_JUVENTUD" forKey:@"KeyWord"];
    
    [arrProvience addObject:dicPinar];
    [arrProvience addObject:dicHabana];
    [arrProvience addObject:dicArtemisa];
    [arrProvience addObject:dicMayabeque];
    [arrProvience addObject:dicMatanzas];
    [arrProvience addObject:dicVillas];
    [arrProvience addObject:dicCienfuegos];
    [arrProvience addObject:dicSpiritus];
    [arrProvience addObject:dicCiego];
    [arrProvience addObject:dicCamag];
    [arrProvience addObject:dicLas];
    [arrProvience addObject:dicHolg];
    [arrProvience addObject:dicGranma];
    [arrProvience addObject:dicSantiago];
    [arrProvience addObject:dicGuan];
    [arrProvience addObject:dicIsla];

    //===========================================================//
    
    
    //============================== States ========================//
    arrStates = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicAlabama = [[NSMutableDictionary alloc]init];
    [dicAlabama setObject:@"Alabama" forKey:@"English_name"];
    [dicAlabama setObject:@"Alabama" forKey:@"Spanish_name"];
    [dicAlabama setObject:@"AL" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicAlaska = [[NSMutableDictionary alloc]init];
    [dicAlaska setObject:@"Alaska" forKey:@"English_name"];
    [dicAlaska setObject:@"Alaska" forKey:@"Spanish_name"];
    [dicAlaska setObject:@"AK" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicArizona = [[NSMutableDictionary alloc]init];
    [dicArizona setObject:@"Arizona" forKey:@"English_name"];
    [dicArizona setObject:@"Arizona" forKey:@"Spanish_name"];
    [dicArizona setObject:@"AZ" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicArkansas = [[NSMutableDictionary alloc]init];
    [dicArkansas setObject:@"Arkansas" forKey:@"English_name"];
    [dicArkansas setObject:@"Arkansas" forKey:@"Spanish_name"];
    [dicArkansas setObject:@"AR" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCalifornia = [[NSMutableDictionary alloc]init];
    [dicCalifornia setObject:@"California" forKey:@"English_name"];
    [dicCalifornia setObject:@"California" forKey:@"Spanish_name"];
    [dicCalifornia setObject:@"CA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicColorado = [[NSMutableDictionary alloc]init];
    [dicColorado setObject:@"Colorado" forKey:@"English_name"];
    [dicColorado setObject:@"Colorado" forKey:@"Spanish_name"];
    [dicColorado setObject:@"CO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicConnecticut = [[NSMutableDictionary alloc]init];
    [dicConnecticut setObject:@"Connecticut" forKey:@"English_name"];
    [dicConnecticut setObject:@"Connecticut" forKey:@"Spanish_name"];
    [dicConnecticut setObject:@"CT" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicDelaware = [[NSMutableDictionary alloc]init];
    [dicDelaware setObject:@"Delaware" forKey:@"English_name"];
    [dicDelaware setObject:@"Delaware" forKey:@"Spanish_name"];
    [dicDelaware setObject:@"DE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicFlorida = [[NSMutableDictionary alloc]init];
    [dicFlorida setObject:@"Florida" forKey:@"English_name"];
    [dicFlorida setObject:@"Florida" forKey:@"Spanish_name"];
    [dicFlorida setObject:@"FL" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicGeorgia = [[NSMutableDictionary alloc]init];
    [dicGeorgia setObject:@"Georgia" forKey:@"English_name"];
    [dicGeorgia setObject:@"Georgia" forKey:@"Spanish_name"];
    [dicGeorgia setObject:@"GA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicHawaii = [[NSMutableDictionary alloc]init];
    [dicHawaii setObject:@"Hawaii" forKey:@"English_name"];
    [dicHawaii setObject:@"Hawaii" forKey:@"Spanish_name"];
    [dicHawaii setObject:@"HI" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIdaho = [[NSMutableDictionary alloc]init];
    [dicIdaho setObject:@"Idaho" forKey:@"English_name"];
    [dicIdaho setObject:@"Idaho" forKey:@"Spanish_name"];
    [dicIdaho setObject:@"ID" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIllinois = [[NSMutableDictionary alloc]init];
    [dicIllinois setObject:@"Illinois" forKey:@"English_name"];
    [dicIllinois setObject:@"Illinois" forKey:@"Spanish_name"];
    [dicIllinois setObject:@"IL" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIndiana = [[NSMutableDictionary alloc]init];
    [dicIndiana setObject:@"Indiana" forKey:@"English_name"];
    [dicIndiana setObject:@"Indiana" forKey:@"Spanish_name"];
    [dicIndiana setObject:@"IN" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIowa = [[NSMutableDictionary alloc]init];
    [dicIowa setObject:@"Iowa" forKey:@"English_name"];
    [dicIowa setObject:@"Iowa" forKey:@"Spanish_name"];
    [dicIowa setObject:@"IA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicKansas = [[NSMutableDictionary alloc]init];
    [dicKansas setObject:@"Kansas" forKey:@"English_name"];
    [dicKansas setObject:@"Kansas" forKey:@"Spanish_name"];
    [dicKansas setObject:@"KS" forKey:@"KeyWord"];
    
    
    NSMutableDictionary * dicKentucky = [[NSMutableDictionary alloc]init];
    [dicKentucky setObject:@"Kentucky" forKey:@"English_name"];
    [dicKentucky setObject:@"Kentucky" forKey:@"Spanish_name"];
    [dicKentucky setObject:@"KY" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicLouisiana = [[NSMutableDictionary alloc]init];
    [dicLouisiana setObject:@"Louisiana" forKey:@"English_name"];
    [dicLouisiana setObject:@"Louisiana" forKey:@"Spanish_name"];
    [dicLouisiana setObject:@"LA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMaine = [[NSMutableDictionary alloc]init];
    [dicMaine setObject:@"Maine" forKey:@"English_name"];
    [dicMaine setObject:@"Maine" forKey:@"Spanish_name"];
    [dicMaine setObject:@"ME" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMaryland = [[NSMutableDictionary alloc]init];
    [dicMaryland setObject:@"Maryland" forKey:@"English_name"];
    [dicMaryland setObject:@"Maryland" forKey:@"Spanish_name"];
    [dicMaryland setObject:@"MD" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMassachusetts = [[NSMutableDictionary alloc]init];
    [dicMassachusetts setObject:@"Massachusetts" forKey:@"English_name"];
    [dicMassachusetts setObject:@"Massachusetts" forKey:@"Spanish_name"];
    [dicMassachusetts setObject:@"MA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMichigan = [[NSMutableDictionary alloc]init];
    [dicMichigan setObject:@"Michigan" forKey:@"English_name"];
    [dicMichigan setObject:@"Michigan" forKey:@"Spanish_name"];
    [dicMichigan setObject:@"MI" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMinnesota = [[NSMutableDictionary alloc]init];
    [dicMinnesota setObject:@"Minnesota" forKey:@"English_name"];
    [dicMinnesota setObject:@"Minnesota" forKey:@"Spanish_name"];
    [dicMinnesota setObject:@"MN" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMississippi = [[NSMutableDictionary alloc]init];
    [dicMississippi setObject:@"Mississippi" forKey:@"English_name"];
    [dicMississippi setObject:@"Mississippi" forKey:@"Spanish_name"];
    [dicMississippi setObject:@"MS" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMissouri = [[NSMutableDictionary alloc]init];
    [dicMissouri setObject:@"Missouri" forKey:@"English_name"];
    [dicMissouri setObject:@"Missouri" forKey:@"Spanish_name"];
    [dicMissouri setObject:@"MO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicMontana = [[NSMutableDictionary alloc]init];
    [dicMontana setObject:@"Montana" forKey:@"English_name"];
    [dicMontana setObject:@"Montana" forKey:@"Spanish_name"];
    [dicMontana setObject:@"MT" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicNebraska = [[NSMutableDictionary alloc]init];
    [dicNebraska setObject:@"Nebraska" forKey:@"English_name"];
    [dicNebraska setObject:@"Nebraska" forKey:@"Spanish_name"];
    [dicNebraska setObject:@"NE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicNevada = [[NSMutableDictionary alloc]init];
    [dicNevada setObject:@"Nevada" forKey:@"English_name"];
    [dicNevada setObject:@"Nevada" forKey:@"Spanish_name"];
    [dicNevada setObject:@"NV" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicNew = [[NSMutableDictionary alloc]init];
    [dicNew setObject:@"New Hampshire" forKey:@"English_name"];
    [dicNew setObject:@"New Hampshire" forKey:@"Spanish_name"];
    [dicNew setObject:@"NH" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicJersey = [[NSMutableDictionary alloc]init];
    [dicJersey setObject:@"New Jersey" forKey:@"English_name"];
    [dicJersey setObject:@"New Jersey" forKey:@"Spanish_name"];
    [dicJersey setObject:@"NJ" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicNewMexico = [[NSMutableDictionary alloc]init];
    [dicNewMexico setObject:@"New Mexico" forKey:@"English_name"];
    [dicNewMexico setObject:@"New Mexico" forKey:@"Spanish_name"];
    [dicNewMexico setObject:@"NM" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicNewYork = [[NSMutableDictionary alloc]init];
    [dicNewYork setObject:@"New York" forKey:@"English_name"];
    [dicNewYork setObject:@"New York" forKey:@"Spanish_name"];
    [dicNewYork setObject:@"NY" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCarolina = [[NSMutableDictionary alloc]init];
    [dicCarolina setObject:@"North Carolina" forKey:@"English_name"];
    [dicCarolina setObject:@"North Carolina" forKey:@"Spanish_name"];
    [dicCarolina setObject:@"NC" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicDakota = [[NSMutableDictionary alloc]init];
    [dicDakota setObject:@"North Dakota" forKey:@"English_name"];
    [dicDakota setObject:@"North Dakota" forKey:@"Spanish_name"];
    [dicDakota setObject:@"ND" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOhio = [[NSMutableDictionary alloc]init];
    [dicOhio setObject:@"Ohio" forKey:@"English_name"];
    [dicOhio setObject:@"Ohio" forKey:@"Spanish_name"];
    [dicOhio setObject:@"OH" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOklahoma = [[NSMutableDictionary alloc]init];
    [dicOklahoma setObject:@"Oklahoma" forKey:@"English_name"];
    [dicOklahoma setObject:@"Oklahoma" forKey:@"Spanish_name"];
    [dicOklahoma setObject:@"OK" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOregon = [[NSMutableDictionary alloc]init];
    [dicOregon setObject:@"Oregon" forKey:@"English_name"];
    [dicOregon setObject:@"Oregon" forKey:@"Spanish_name"];
    [dicOregon setObject:@"OR" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicPennsylvania = [[NSMutableDictionary alloc]init];
    [dicPennsylvania setObject:@"Pennsylvania" forKey:@"English_name"];
    [dicPennsylvania setObject:@"Pennsylvania" forKey:@"Spanish_name"];
    [dicPennsylvania setObject:@"PA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicRhode = [[NSMutableDictionary alloc]init];
    [dicRhode setObject:@"Rhode Island" forKey:@"English_name"];
    [dicRhode setObject:@"Rhode Island" forKey:@"Spanish_name"];
    [dicRhode setObject:@"RI" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSouthCarolina = [[NSMutableDictionary alloc]init];
    [dicSouthCarolina setObject:@"South Carolina" forKey:@"English_name"];
    [dicSouthCarolina setObject:@"South Carolina" forKey:@"Spanish_name"];
    [dicSouthCarolina setObject:@"SC" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSouthDakota = [[NSMutableDictionary alloc]init];
    [dicSouthDakota setObject:@"South Dakota" forKey:@"English_name"];
    [dicSouthDakota setObject:@"South Dakota" forKey:@"Spanish_name"];
    [dicSouthDakota setObject:@"SD" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicTennessee = [[NSMutableDictionary alloc]init];
    [dicTennessee setObject:@"Tennessee" forKey:@"English_name"];
    [dicTennessee setObject:@"Tennessee" forKey:@"Spanish_name"];
    [dicTennessee setObject:@"TN" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicTexas = [[NSMutableDictionary alloc]init];
    [dicTexas setObject:@"Texas" forKey:@"English_name"];
    [dicTexas setObject:@"Texas" forKey:@"Spanish_name"];
    [dicTexas setObject:@"TX" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicUtah = [[NSMutableDictionary alloc]init];
    [dicUtah setObject:@"Utah" forKey:@"English_name"];
    [dicUtah setObject:@"Utah" forKey:@"Spanish_name"];
    [dicUtah setObject:@"UT" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicVermont = [[NSMutableDictionary alloc]init];
    [dicVermont setObject:@"Vermont" forKey:@"English_name"];
    [dicVermont setObject:@"Vermont" forKey:@"Spanish_name"];
    [dicVermont setObject:@"VT" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicVirginia = [[NSMutableDictionary alloc]init];
    [dicVirginia setObject:@"Virginia" forKey:@"English_name"];
    [dicVirginia setObject:@"Virginia" forKey:@"Spanish_name"];
    [dicVirginia setObject:@"VA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicWashington = [[NSMutableDictionary alloc]init];
    [dicWashington setObject:@"Washington" forKey:@"English_name"];
    [dicWashington setObject:@"Washington" forKey:@"Spanish_name"];
    [dicWashington setObject:@"WA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicWestVirginia = [[NSMutableDictionary alloc]init];
    [dicWestVirginia setObject:@"West Virginia" forKey:@"English_name"];
    [dicWestVirginia setObject:@"West Virginia" forKey:@"Spanish_name"];
    [dicWestVirginia setObject:@"WV" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicWisconsin = [[NSMutableDictionary alloc]init];
    [dicWisconsin setObject:@"Wisconsin" forKey:@"English_name"];
    [dicWisconsin setObject:@"Wisconsin" forKey:@"Spanish_name"];
    [dicWisconsin setObject:@"WI" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicWyoming = [[NSMutableDictionary alloc]init];
    [dicWyoming setObject:@"Wyoming" forKey:@"English_name"];
    [dicWyoming setObject:@"Wyoming" forKey:@"Spanish_name"];
    [dicWyoming setObject:@"WY" forKey:@"KeyWord"];
    
    [arrStates addObject:dicAlabama];
    [arrStates addObject:dicAlaska];
    [arrStates addObject:dicArizona];
    [arrStates addObject:dicArkansas];
    [arrStates addObject:dicCalifornia];
    [arrStates addObject:dicColorado];
   // [arrStates addObject:dicCienfuegos];//ajay
    [arrStates addObject:dicConnecticut];
    [arrStates addObject:dicDelaware];
    [arrStates addObject:dicFlorida];
    [arrStates addObject:dicGeorgia];
    [arrStates addObject:dicHawaii];
    [arrStates addObject:dicIdaho];
    [arrStates addObject:dicIllinois];
    [arrStates addObject:dicIndiana];
    [arrStates addObject:dicIowa];
    [arrStates addObject:dicKansas];
    [arrStates addObject:dicKentucky];
    [arrStates addObject:dicLouisiana];
    [arrStates addObject:dicMaine];
    [arrStates addObject:dicMaryland];
    [arrStates addObject:dicMassachusetts];
    [arrStates addObject:dicMichigan];
    [arrStates addObject:dicMinnesota];
    [arrStates addObject:dicMissouri];
    [arrStates addObject:dicMontana];
    [arrStates addObject:dicNebraska];
    [arrStates addObject:dicNevada];
    [arrStates addObject:dicNew];
    [arrStates addObject:dicJersey];
    [arrStates addObject:dicNewMexico];
    [arrStates addObject:dicNewYork];
    [arrStates addObject:dicCarolina];
    [arrStates addObject:dicDakota];
    [arrStates addObject:dicOhio];
    [arrStates addObject:dicOklahoma];
    [arrStates addObject:dicOregon];
    [arrStates addObject:dicPennsylvania];
    [arrStates addObject:dicRhode];
    [arrStates addObject:dicSouthCarolina];
    [arrStates addObject:dicSouthDakota];
    [arrStates addObject:dicTennessee];
    [arrStates addObject:dicTexas];
    [arrStates addObject:dicUtah];
    [arrStates addObject:dicVermont];
    [arrStates addObject:dicVirginia];
    [arrStates addObject:dicWashington];
    [arrStates addObject:dicWestVirginia];
    [arrStates addObject:dicWisconsin];
    [arrStates addObject:dicWyoming];

    //===========================================================//
    
    //=============Religion==================//
    //============================== Country ========================//
    arrReligion = [[NSMutableArray alloc]init];
    
    NSMutableDictionary * dicAtheism = [[NSMutableDictionary alloc]init];
    [dicAtheism setObject:@"Atheism" forKey:@"English_name"];
    [dicAtheism setObject:@"Ateísmo" forKey:@"Spanish_name"];
    [dicAtheism setObject:@"ATEISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSecularism = [[NSMutableDictionary alloc]init];
    [dicSecularism setObject:@"Secularism" forKey:@"English_name"];
    [dicSecularism setObject:@"Secularismo" forKey:@"Spanish_name"];
    [dicSecularism setObject:@"SECULARISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicAgnosticism = [[NSMutableDictionary alloc]init];
    [dicAgnosticism setObject:@"Agnosticism" forKey:@"English_name"];
    [dicAgnosticism setObject:@"Agnosticismo" forKey:@"Spanish_name"];
    [dicAgnosticism setObject:@"AGNOSTICISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicCatholicism = [[NSMutableDictionary alloc]init];
    [dicCatholicism setObject:@"Catholicism" forKey:@"English_name"];
    [dicCatholicism setObject:@"Catolicismo" forKey:@"Spanish_name"];
    [dicCatholicism setObject:@"CATOLICISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicChristianity = [[NSMutableDictionary alloc]init];
    [dicChristianity setObject:@"Christianity" forKey:@"English_name"];
    [dicChristianity setObject:@"Cristianismo" forKey:@"Spanish_name"];
    [dicChristianity setObject:@"CRISTIANISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicIslam = [[NSMutableDictionary alloc]init];
    [dicIslam setObject:@"Islam" forKey:@"English_name"];
    [dicIslam setObject:@"Islam" forKey:@"Spanish_name"];
    [dicIslam setObject:@"ISLAM" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicRaftafarism = [[NSMutableDictionary alloc]init];
    [dicRaftafarism setObject:@"Raftafarism" forKey:@"English_name"];
    [dicRaftafarism setObject:@"Raftafarismo" forKey:@"Spanish_name"];
    [dicRaftafarism setObject:@"PROTESTANTE" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicJudaism = [[NSMutableDictionary alloc]init];
    [dicJudaism setObject:@"Judaism" forKey:@"English_name"];
    [dicJudaism setObject:@"Judaismo" forKey:@"Spanish_name"];
    [dicJudaism setObject:@"JUDAISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSpiritism = [[NSMutableDictionary alloc]init];
    [dicSpiritism setObject:@"Spiritism" forKey:@"English_name"];
    [dicSpiritism setObject:@"Espiritismo" forKey:@"Spanish_name"];
    [dicSpiritism setObject:@"YORUBA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicSikhism = [[NSMutableDictionary alloc]init];
    [dicSikhism setObject:@"Sikhism" forKey:@"English_name"];
    [dicSikhism setObject:@"Sijismo" forKey:@"Spanish_name"];
    [dicSikhism setObject:@"ABAKUA" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicBuddhism = [[NSMutableDictionary alloc]init];
    [dicBuddhism setObject:@"Buddhism" forKey:@"English_name"];
    [dicBuddhism setObject:@"Budismo" forKey:@"Spanish_name"];
    [dicBuddhism setObject:@"BUDISMO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicOther5 = [[NSMutableDictionary alloc]init];
    [dicOther5 setObject:@"Other" forKey:@"English_name"];
    [dicOther5 setObject:@"Otra" forKey:@"Spanish_name"];
    [dicOther5 setObject:@"OTRO" forKey:@"KeyWord"];
    
  
    [arrReligion addObject:dicAtheism];
    [arrReligion addObject:dicSecularism];
    [arrReligion addObject:dicAgnosticism];
    [arrReligion addObject:dicCatholicism];
    [arrReligion addObject:dicChristianity];
    [arrReligion addObject:dicIslam];
    [arrReligion addObject:dicRaftafarism];
    [arrReligion addObject:dicJudaism];
    [arrReligion addObject:dicSpiritism];
    [arrReligion addObject:dicSikhism];
    [arrReligion addObject:dicBuddhism];
    [arrReligion addObject:dicOther5];
    
  

   /* [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MoveNotificationtab" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MoveNotificationtab:) name:@"MoveNotificationtab" object:nil];
    */
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CallwebapiIncrementHeatrCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(CallwebapiIncrementHeatrCount)
                                                 name:@"CallwebapiIncrementHeatrCount"
                                               object:nil];
    
    [self setDetailPickerViews];

    isFromimagePicker = NO;
}

-(void)viewWillAppear:(BOOL)animated {
    
    
    if ([_strisFrom isEqualToString:@"YES"]) {
    [APP_DELEGATE hideTabBar:self.tabBarController];
        UIButton * btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnBack setFrame:CGRectMake(0, 20, 44, 44)];
        [btnBack setImage:[UIImage imageNamed:@"back-btn.png"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(btnBackClicked:) forControlEvents:UIControlEventTouchUpInside];
        [navview addSubview:btnBack];
        
        imgBack.frame = CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64);
        
    }else{
    
        //===========================================================//
        imgUnreadMessageCount = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2), DEVICE_HEIGHT-49, 35, 25)];
        imgUnreadMessageCount.image = [UIImage imageNamed:@"chat-notification.png"];
        imgUnreadMessageCount.hidden = YES;
        [[appDelegate window] addSubview:imgUnreadMessageCount];
        
        lblUnreadCount = [[UILabel alloc]init];
        lblUnreadCount.hidden = YES;
        lblUnreadCount.frame = CGRectMake((DEVICE_WIDTH/2), DEVICE_HEIGHT-51, 35, 25);
        lblUnreadCount.textColor = [UIColor whiteColor];
        lblUnreadCount.font = [UIFont boldSystemFontOfSize:18];
        lblUnreadCount.textAlignment = NSTextAlignmentCenter;
        //lblUnreadCount.frame = imgUnreadMessageCount.frame;
        [[appDelegate window] addSubview:lblUnreadCount];
        
//        if ([arrUnreadTotalCount count]>0) {
//            NSLog(@"arrUnreadTotalCount%@",arrUnreadTotalCount);
//            imgUnreadMessageCount.hidden = NO;
//            lblUnreadCount.hidden = NO;
//            
//            lblUnreadCount.text = [NSString stringWithFormat:@"%lu",[arrUnreadTotalCount count]];
//        }
//        else{
//            imgUnreadMessageCount.hidden = YES;
//            lblUnreadCount.hidden = YES;
//            
//        }
        
        [self unreadcount];
    }
    
    changeLanguage = NO;
    
    if (isFromimagePicker) {
    }
    else{
        [self upDatewebserviceCalling];
    }
    
    [self ShowTransperentForFloewrs];
    [self ShowTransperentCrown];
}
-(void)viewWillDisappear:(BOOL)animated {
    imgUnreadMessageCount.hidden = YES;
    lblUnreadCount.hidden = YES;
    [imgUnreadMessageCount removeFromSuperview];
    [lblUnreadCount removeFromSuperview];
}
-(void)viewDidDisappear:(BOOL)animated {
    [imgUnreadMessageCount removeFromSuperview];
    [lblUnreadCount removeFromSuperview];
    
    isFromimagePicker = NO;
    [self hideKeyboard];
}

-(void)CallwebapiIncrementHeatrCount{
    [self unreadcount];
}
-(void)ShowTransperentForFloewrs {
    
    
    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperent.backgroundColor = [UIColor clearColor];
    viewTransperent.hidden = YES;
//    viewTransperent.alpha = 0.9;
//    viewTransperent.userInteractionEnabled  = YES;
//    viewTransperent.layer.cornerRadius = 5;
//    viewTransperent.clipsToBounds = YES;
//    viewTransperent.layer.shadowColor = [UIColor grayColor].CGColor;
//    viewTransperent.layer.shadowOffset = CGSizeMake(3, 3);
//    viewTransperent.layer.shadowOpacity = 5.0;
//    viewTransperent.layer.shadowRadius = 5.0;

    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewShadow.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [viewTransperent addSubview:viewShadow];
    
    UIView * viewShadow2= [[UIView alloc]init];
    viewShadow2.frame = viewTransperent.frame;
    viewShadow2.backgroundColor = [UIColor whiteColor];
    [viewShadow2 setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [viewTransperent addSubview:viewShadow2];
    
    UILabel * lblMessage = [[UILabel alloc]initWithFrame:CGRectMake(20,( viewTransperent.frame.size.height/2)-(100/2), viewTransperent.frame.size.width-40, 100)];
    if(IS_IPHONE_4 || IS_IPHONE_5){
       lblMessage.frame = CGRectMake(20,( viewTransperent.frame.size.height/2)-(100/2), viewTransperent.frame.size.width-40, 130);
    }
    lblMessage.numberOfLines = 0;
    lblMessage.textColor = darkGayColor;
    lblMessage.backgroundColor = [UIColor clearColor];
    lblMessage.text = [TSLanguageManager localizedString:@"profile_popup_flower"];
    lblMessage.textAlignment = NSTextAlignmentCenter;
    [viewTransperent addSubview:lblMessage];
    
    UIButton * btnFlowerPopClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFlowerPopClick.frame = CGRectMake(20,lblMessage.frame.origin.y+lblMessage.frame.size.height+5, viewTransperent.frame.size.width-40,40);
    [btnFlowerPopClick setTitle:@"Ok" forState:UIControlStateNormal];
//    [btnFlowerClick setBackgroundImage:[APP_DELEGATE colorWithHexString:violetgreenColor] forState:UIControlStateNormal];
    [btnFlowerPopClick setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];

//    [btnFlowerPopClick setBackgroundColor:violetgreenColor];
    btnFlowerPopClick.layer.cornerRadius = 5.0;
    [btnFlowerPopClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnFlowerPopClick.clipsToBounds = YES;
    [btnFlowerPopClick addTarget:self action:@selector(btnFlowerPopClick:) forControlEvents:UIControlEventTouchUpInside];
    btnFlowerPopClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperent addSubview:btnFlowerPopClick];
    
    UIImageView * imgFlowrePop = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(23/2),lblMessage.frame.origin.y-42, 23, 37)];
    imgFlowrePop.image = [UIImage imageNamed:@"Flower-button.png"];
    [viewTransperent addSubview:imgFlowrePop];
    
    [[appDelegate window] addSubview:viewTransperent];
}

-(void)ShowTransperentCrown
{
    
    viewTransperentCrown = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperentCrown.backgroundColor = [UIColor clearColor];
    viewTransperentCrown.hidden = YES;
//    viewTransperentCrown.alpha = 0.9;
//    viewTransperentCrown.userInteractionEnabled  = YES;
//    viewTransperentCrown.layer.cornerRadius = 5;
//    viewTransperentCrown.clipsToBounds = YES;
//    viewTransperentCrown.layer.shadowColor = [UIColor grayColor].CGColor;
//    viewTransperentCrown.layer.shadowOffset = CGSizeMake(3, 3);
//    viewTransperentCrown.layer.shadowOpacity = 5.0;
//    viewTransperentCrown.layer.shadowRadius = 5.0;
    
    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewTransperentCrown.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [viewTransperentCrown addSubview:viewShadow];
    
    UIView * viewShadow2= [[UIView alloc]init];
    viewShadow2.frame = viewTransperentCrown.frame;
    viewShadow2.backgroundColor = [UIColor whiteColor];
    [viewShadow2 setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [viewTransperentCrown addSubview:viewShadow2];
    
    UILabel * lblMessageCrown = [[UILabel alloc]initWithFrame:CGRectMake(20,( viewTransperentCrown.frame.size.height/2)-(100/2), viewTransperentCrown.frame.size.width-40, 120)];
    if(IS_IPHONE_4 || IS_IPHONE_5){
        lblMessageCrown.frame = CGRectMake(20,( viewTransperent.frame.size.height/2)-(100/2), viewTransperent.frame.size.width-40, 130);
    }
    lblMessageCrown.numberOfLines = 0;
    lblMessageCrown.textColor = darkGayColor;
    lblMessageCrown.backgroundColor = [UIColor clearColor];
    lblMessageCrown.text = [TSLanguageManager localizedString:@"We will add a nice crown to your head for the next three days, and besides looking great, you will be shown way more often to other people, increasing your chances to get requests."];
    lblMessageCrown.textAlignment = NSTextAlignmentCenter;
    [viewTransperentCrown addSubview:lblMessageCrown];
    
    NSInteger widthview = viewTransperentCrown.frame.size.width/2;
    
    UIButton * btnCrownPopOkClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCrownPopOkClick.frame = CGRectMake(5,lblMessageCrown.frame.origin.y+lblMessageCrown.frame.size.height+5, widthview-10,35);
    [btnCrownPopOkClick setTitle:@"Ok" forState:UIControlStateNormal];
    //    [btnFlowerClick setBackgroundImage:[APP_DELEGATE colorWithHexString:violetgreenColor] forState:UIControlStateNormal];
    [btnCrownPopOkClick setBackgroundColor:violetgreenColor];
    btnCrownPopOkClick.layer.cornerRadius = 5.0;
    [btnCrownPopOkClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCrownPopOkClick.clipsToBounds = YES;
    [btnCrownPopOkClick addTarget:self action:@selector(btnCrownPopOkClick:) forControlEvents:UIControlEventTouchUpInside];
    btnCrownPopOkClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentCrown addSubview:btnCrownPopOkClick];
    
    UIButton * btnCrownPopCancelClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCrownPopCancelClick.frame = CGRectMake(widthview+5,lblMessageCrown.frame.origin.y+lblMessageCrown.frame.size.height+5, widthview-10,35);
    [btnCrownPopCancelClick setTitle:[TSLanguageManager localizedString:@"Cancel"] forState:UIControlStateNormal];
    //    [btnFlowerClick setBackgroundImage:[APP_DELEGATE colorWithHexString:violetgreenColor] forState:UIControlStateNormal];
    [btnCrownPopCancelClick setBackgroundColor:darkGayColor];
    btnCrownPopCancelClick.layer.cornerRadius = 5.0;
    [btnCrownPopCancelClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCrownPopCancelClick.clipsToBounds = YES;
    [btnCrownPopCancelClick addTarget:self action:@selector(btnCrownPopCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    btnCrownPopCancelClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentCrown addSubview:btnCrownPopCancelClick];
    
    UIImageView * imgCrownPop = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(42/2),lblMessageCrown.frame.origin.y-48, 66, 42)];
    imgCrownPop.image = [UIImage imageNamed:@"Male-Crown.png"];
    [viewTransperentCrown addSubview:imgCrownPop];
    
    
    [[appDelegate window] addSubview:viewTransperentCrown];
}
/*-(void)MoveNotificationtab:(NSNotification *) notification
{
    NSLog(@"notification==>%@",notification.userInfo);
    
}*/
#pragma mark - Actions
-(void)btnBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnContinueClicked:(id)sender
{
    [self hideKeyboard];
    if ([txtfname.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter UserName"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtSex.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Sex"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtSexOrientation.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Sexual Orientation"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtBirthDay.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Birthday"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtCountry.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Country"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
        
    }
    else if ([strCountryKeyWord isEqualToString:@"CU"])
    {
        if ([txtState.text isEqualToString:@""]) {
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Province"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                }];
            }];
            [alertView showWithAnimation:Alert_Animation_Type];
        }
        else{
            [self callWebapiforUpdateProfile];
            //[self callWebapiforUpdateImage];
        }
    }
    else if ([strCountryKeyWord isEqualToString:@"US"])
    {
        if ([txtState.text isEqualToString:@""]) {
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter State"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                }];
            }];
            [alertView showWithAnimation:Alert_Animation_Type];
            
        }
        else{
            [self callWebapiforUpdateProfile];
            //[self callWebapiforUpdateImage];
        }
    }
    else
    {
        //[self CallwebServiceforEmail];
        [self callWebapiforUpdateProfile];
        //[self callWebapiforUpdateImage];
    }
}
-(void)btnStoreClicked:(id)sender
{
    StoreVC * store = [[StoreVC alloc]init];
    
    [self.navigationController pushViewController:store animated:YES];
}
-(void)btnlogoutClicked:(id)sender
{

    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Are you sure want to Logout"] cancelButtonTitle:ALERT_CANCEL otherButtonTitles: OK_BTN, nil];
    [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
        [alertView hideWithCompletionBlock:^{
            if (buttonIndex == 1) {
                BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
                if (isNetAvaliable == NO)
                {
                }else{
                    [btnlogoutButton setEnabled:NO];
                    [activityIndicatorForlogout startAnimating];
                    //isForCrashLogout = YES;
                    NSString * webServiceName = @"api/logout";
                    
                    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
                    
                    if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
                    {
                        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
                    }
                    else
                    {
                        [parameter_dict setObject:@"" forKey:@"token"];
                    }
                    
                    URLManager *manager = [[URLManager alloc] init];
                    manager.delegate = self;
                    manager.commandName = @"Logout";
                    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
                }
            }
        }];
    }];
    [alertView showWithAnimation:Alert_Animation_Type];

 }
-(void)btnFlowerClicked:(id)sender
{
    viewTransperent.hidden = NO;
}
-(void)btnCrownClicked:(id)sender
{
    viewTransperentCrown . hidden = NO;
}
-(void)btnFlowerPopClick:(id)sender
{
    viewTransperent.hidden = YES;
}
-(void)btnCrownPopOkClick:(id)sender
{
    [self callWebApiForCrownSetting];

    viewTransperentCrown.hidden = YES;
}
-(void)btnCrownPopCancelClick:(id)sender
{
    viewTransperentCrown.hidden = YES;
}
#pragma mark - Navigation Frame
-(void)SetNavigationbar
{
    navview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    navview.backgroundColor =navigationBackgroundcolor;
    navview.userInteractionEnabled=YES;
    // *** Set masks bounds to NO to display shadow visible ***
    navview.layer.masksToBounds = NO;
    // *** Set light gray color as shown in sample ***
    navview.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    // *** *** Use following to add Shadow top, left ***
    //    self.avatarImageView.layer.shadowOffset = CGSizeMake(-5.0f, -5.0f);
    
    // *** Use following to add Shadow bottom, right ***
    navview.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    
    // *** Use following to add Shadow top, left, bottom, right ***
    // avatarImageView.layer.shadowOffset = CGSizeZero;
    navview.layer.shadowRadius = 5.0f;
    
    // *** Set shadowOpacity to full (1) ***
    navview.layer.shadowOpacity = 1.0f;
    [self.view addSubview:navview];
    
    UIImageView * imgLogo = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(114/2), (64/2)-(24/7), 114, 27)];
    imgLogo.image = [UIImage imageNamed:Navigationlogo];
    [navview addSubview:imgLogo];

}
-(void)setFrame {
   
    imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-49)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    scrlContent = [[UIScrollView alloc]init];
    
    imgBorder = [[UIImageView alloc]init];
    imgProfile = [[AsyncImageView alloc]init];
    
    imgInfo = [[UIImageView alloc]init];
    lblUserName = [[UILabel alloc]init];
    imgFlowerCount = [[UIImageView alloc]init];
    imgFlower = [[UIImageView alloc]init];
    imgSmallCrown = [[UIImageView alloc]init];
    imgSmallCrownCount = [[UIImageView alloc]init];
    lblFlowerCount = [[UILabel alloc]init];
    lblCrwonCount = [[UILabel alloc]init];
    btnFlower = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCrown = [UIButton buttonWithType:UIButtonTypeCustom];
    lblFlowerCount = [[UILabel alloc]init];
    lblCrwonCount = [[UILabel alloc]init];
    
    nameviewTextBox = [[UIImageView alloc]init];
    imgLanguageTextBox = [[UIImageView alloc]init];
    imgSexTextBox = [[UIImageView alloc]init];
    imgSexOrienationTextBox = [[UIImageView alloc]init];
    imgBirthdayTextBox = [[UIImageView alloc]init];
    imgBodyTextBox = [[UIImageView alloc]init];
    imgEyesTextBox = [[UIImageView alloc]init];
    imgHairTextBox = [[UIImageView alloc]init];
    imgSkinTextBox = [[UIImageView alloc]init];
    imgCivilStatusTextBox = [[UIImageView alloc]init];
    imgShoolLevelTextBox = [[UIImageView alloc]init];
    imgProfessionTextbox = [[UIImageView alloc]init];
    imgCityTextBox = [[UIImageView alloc]init];
    imgCountryTextBox = [[UIImageView alloc]init];
    imgInterstTextBox = [[UIImageView alloc]init];
    imgReligionTextBox = [[UIImageView alloc]init];
    imgStateTextBox = [[UIImageView alloc]init];
    imageStateDropdown = [[UIImageView alloc]init];
    imageReligionDropdown = [[UIImageView alloc]init];
    imgCrownProfile= [[UIImageView alloc]init];
    
    txtfname = [[UITextField alloc]init];
    txtLanguage = [[UITextField alloc]init];
    txtSex = [[UITextField alloc]init];
    txtSexOrientation = [[UITextField alloc]init];;
    txtBirthDay = [[UITextField alloc]init];;
    txtBody = [[UITextField alloc]init];
    txtEyes = [[UITextField alloc]init];
    txtHair = [[UITextField alloc]init];
    txtSkin = [[UITextField alloc]init];
    txtCivilStatus = [[UITextField alloc]init];
    txtSchool = [[UITextField alloc]init];
    txtCivilProvision = [[UITextField alloc]init];
    txtCity = [[UITextField alloc]init];
    txtCountry = [[UITextField alloc]init];
//    txtinterst = [[UITextField alloc]init];
    txtReligion = [[UITextField alloc]init];
    txtState = [[UITextField alloc]init];
    lblInterst = [[UILabel alloc]init];
    
    imgSexDownArrow = [[UIImageView alloc]init];
    imgSexorientaionDownArrow = [[UIImageView alloc]init];
    imgBirthDownArrow = [[UIImageView alloc]init];
    imageBodyDropdown = [[UIImageView alloc]init];
    imageEyeDropdown = [[UIImageView alloc]init];
    imageHairDropdown = [[UIImageView alloc]init];
    imageSkinDropdown = [[UIImageView alloc]init];
    imageCivilStatusDropdown = [[UIImageView alloc]init];
    imageSchoolDropdown = [[UIImageView alloc]init];
    imageCountryDropdown = [[UIImageView alloc]init];
    
    btnContinue= [UIButton buttonWithType:UIButtonTypeCustom];
    btnStoreButton= [UIButton buttonWithType:UIButtonTypeCustom];
    btnlogoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    btnChangeLanguage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSex = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSexOrient=[UIButton buttonWithType:UIButtonTypeCustom];
    btnDate=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBody = [UIButton buttonWithType:UIButtonTypeCustom];
    btnEyes = [UIButton buttonWithType:UIButtonTypeCustom];
    btnHair = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSkin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCivilStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSchool = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCountry = [UIButton buttonWithType:UIButtonTypeCustom];
    btnProvience = [UIButton buttonWithType:UIButtonTypeCustom];
    btnIntrest = [UIButton buttonWithType:UIButtonTypeCustom];
    btnReligion = [UIButton buttonWithType:UIButtonTypeCustom];

    
     activityIndicatorForSave = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

    activityIndicatorForlogout = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicatorForlogout.color = violetgreenColor;;

   
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = violetgreenColor;;
    [imgBack addSubview:placeActivityIndicator];

}
#pragma mark - Frame Settings
-(void)dataPassingtoFields:(NSMutableDictionary*)dicDetails
{
    
    if (IS_IPHONE_5 || IS_IPHONE_4)
    {
        scrlContent.frame = CGRectMake(20, 0, imgBack.frame.size.width-40, imgBack.frame.size.height);
    }
    else{
        scrlContent.frame = CGRectMake(20, 0, imgBack.frame.size.width-40, imgBack.frame.size.height);
    }
    
    scrlContent.backgroundColor = [UIColor clearColor];
    [imgBack addSubview:scrlContent];
    
    int yy = 20;
    //*===================== User_Profile ==========================*//
    
    imgBorder.frame = CGRectMake((scrlContent.frame.size.width/2)-(192/2), yy, 192, 192);
    imgBorder.clipsToBounds=YES;
    imgBorder.layer.cornerRadius = imgBorder.frame.size.width/2;
    imgBorder.image = [UIImage imageNamed:@"male-circle.png"];
    imgBorder.layer.masksToBounds = NO;
    imgBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorder.layer.shadowRadius = 6.0;
    imgBorder.layer.shadowOpacity = 0.4;
    [scrlContent addSubview:imgBorder];
    
    NSString * strGender = @"";
    
    if ([[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]!=[NSNull null]) {
        strGender = [[dicDetails valueForKey:@"profile"]valueForKey:@"gender"];
    }
    if ([strGender isEqualToString:@"F"]) {
        imgBorder.image = [UIImage imageNamed:@"female-circle.png"];
    }
    else {
        imgBorder.image = [UIImage imageNamed:@"male-circle.png"];
    }
    strImageUrl = @"";
    imgProfile.frame = CGRectMake((scrlContent.frame.size.width/2)-(172/2), yy+10, 172, 172);
    imgProfile.clipsToBounds=YES;
    imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2;
    [imgProfile setContentMode:UIViewContentModeScaleAspectFill];
    if ([[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]isEqualToString:@""]){

        strImageUrl = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]];

        if ([strGender isEqualToString:@"F"])
        {
//            [imgProfile setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            imgProfile.image = nil;
            imgProfile.image = [UIImage imageNamed:@"female_avtar.png"];
            
            imgProfile.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]]];
            
                   }
        else{
            
//            [imgProfile setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            imgProfile.image = nil;

            imgProfile.image = [UIImage imageNamed:@"male_avtar.png"];
            
            imgProfile.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]]];
        }
        
        //ImageSelected = YES;

    }else{
        if ([strGender isEqualToString:@"F"])
        {
            imgProfile.image = [UIImage imageNamed:@"female_avtar.png"];
        }
        else
        {
            imgProfile.image = [UIImage imageNamed:@"male_avtar.png"];
        }
       // ImageSelected = NO;

    }
    [scrlContent addSubview:imgProfile];
    
    
    imgCrownProfile.frame = CGRectMake((scrlContent.frame.size.width/2)-(90/2), yy-10, 90, 67);
//    imgCrownProfile.image = [UIImage imageNamed:@"Male-Crown.png"];
    [scrlContent addSubview:imgCrownProfile];
    
    
    NSString * strCrownProfile = @"";
    if ([dicDetails valueForKey:@"crowned"]!=nil && [dicDetails valueForKey:@"crowned"]!=[NSNull null]) {
        strCrownProfile = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"crowned"]];
    }
    
    if ([strCrownProfile isEqualToString:@"1"]) {
        if ([strGender isEqualToString:@"F"])
        {
            imgCrownProfile.image = [UIImage imageNamed:@"Female-Crown.png"];
        }
        else
        {
            imgCrownProfile.image = [UIImage imageNamed:@"Male-Crown.png"];
        }
    }
//    imgCrownProfile.image = [UIImage imageNamed:@"Female-Crown.png"];

    UIButton *btnTakePhoto=[UIButton buttonWithType:UIButtonTypeCustom];
    btnTakePhoto.frame=CGRectMake(imgProfile.frame.origin.x, imgProfile.frame.origin.y, imgProfile.frame.size.width, imgProfile.frame.size.height);
    [btnTakePhoto addTarget:self action:@selector(EditPhotoClick) forControlEvents:UIControlEventTouchUpInside];
    [scrlContent addSubview:btnTakePhoto];
    
    //*===============================================================================*//
    yy = yy + imgBorder.frame.size.height+20;
    
    imgInfo.frame = CGRectMake(20 , yy, scrlContent.frame.size.width-40, 91);
    imgInfo.image = [UIImage imageNamed:@"infobox_icon.png"];
    imgInfo.userInteractionEnabled = YES;
    [scrlContent addSubview:imgInfo];
    
    lblUserName.frame = CGRectMake(0, 10,imgInfo.frame.size.width, 22);
    [lblUserName setTextColor:merunRed];
    [lblUserName setBackgroundColor:[UIColor clearColor]];
    [lblUserName setTextAlignment:NSTextAlignmentCenter];
    [lblUserName setFont:[UIFont systemFontOfSize:20]];
    if ([[dicDetails valueForKey:@"profile"]valueForKey:@"username"]) {
        if (![[[dicDetails valueForKey:@"profile"]valueForKey:@"username"] isEqual:[NSNull null]]) {
            
            lblUserName.text = [NSString stringWithFormat:@"@%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"username"]];
        }
    }
    [imgInfo addSubview:lblUserName];
    
    NSInteger imgWidth = imgInfo.frame.size.width/2;
    
    imgFlowerCount.frame = CGRectMake(imgWidth-45,imgInfo.frame.size.height-42, 39, 33);
    imgFlowerCount.image = [UIImage imageNamed:@"Red-counter.png"];
    imgFlowerCount.userInteractionEnabled = YES;
    [imgInfo addSubview:imgFlowerCount];
    
    imgFlower.frame = CGRectMake(imgWidth-imgFlowerCount.frame.size.width-29,imgInfo.frame.size.height-42, 23, 37);
    imgFlower.image = [UIImage imageNamed:@"Flower-button.png"];
    imgFlower.userInteractionEnabled = YES;
    [imgInfo addSubview:imgFlower];
    
    imgSmallCrown.frame = CGRectMake(imgWidth+3,imgInfo.frame.size.height-42, 39, 28);
    imgSmallCrown.image = [UIImage imageNamed:@"small_male_crown.png"];
    [imgInfo addSubview:imgSmallCrown];
    
    imgSmallCrownCount.frame = CGRectMake(imgWidth+imgSmallCrown.frame.size.width,imgInfo.frame.size.height-42, 39, 33);
    imgSmallCrownCount.image = [UIImage imageNamed:@"Red-counter.png"];
    [imgInfo addSubview:imgSmallCrownCount];
    
    btnFlower.frame = CGRectMake(imgWidth-80, imgInfo.frame.size.height-42, 80, 42) ;
    btnFlower.backgroundColor = [UIColor clearColor];
    [btnFlower addTarget:self action:@selector(btnFlowerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [imgInfo addSubview:btnFlower];
    
    btnCrown.frame = CGRectMake(imgWidth, imgInfo.frame.size.height-42, 80, 42) ;
    btnCrown.backgroundColor = [UIColor clearColor];
    [btnCrown addTarget:self action:@selector(btnCrownClicked:) forControlEvents:UIControlEventTouchUpInside];

    [imgInfo addSubview:btnCrown];
    
    lblFlowerCount.frame = imgFlowerCount.frame;
    lblFlowerCount.frame = CGRectMake(lblFlowerCount.frame.origin.x+5, lblFlowerCount.frame.origin.y, lblFlowerCount.frame.size.width, lblFlowerCount.frame.size.height);
    lblFlowerCount.text = @"";
    lblFlowerCount.font = [UIFont boldSystemFontOfSize:14];
    lblFlowerCount.textColor = [UIColor whiteColor];
    lblFlowerCount.textAlignment = NSTextAlignmentCenter;
    [imgInfo addSubview:lblFlowerCount];
    
    lblCrwonCount.frame = imgSmallCrownCount.frame;
    lblCrwonCount.text = @"";
    lblCrwonCount.frame = CGRectMake(lblCrwonCount.frame.origin.x+5, lblCrwonCount.frame.origin.y, lblCrwonCount.frame.size.width, lblCrwonCount.frame.size.height);
    lblCrwonCount.font = [UIFont boldSystemFontOfSize:14];
    lblCrwonCount.textColor = [UIColor whiteColor];
    lblCrwonCount.textAlignment = NSTextAlignmentCenter;
    [imgInfo addSubview:lblCrwonCount];
    
    NSString * strCrowncount = @"";
    NSString * strFlowerCount = @"";
    
    if ([dicDetails valueForKey:@"crowns"]!=nil && [dicDetails valueForKey:@"crowns"]!=[NSNull null] ){
        strCrowncount = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"crowns"]];
    }
    
    if ([dicDetails valueForKey:@"flowers"]!=nil && [dicDetails valueForKey:@"flowers"]!=[NSNull null] ){
        strFlowerCount = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"flowers"]];
    }
    
    lblFlowerCount.text = strFlowerCount;
    lblCrwonCount.text = strCrowncount;
    
    yy = yy + imgInfo.frame.size.height+5;
    
    //================== UserName ================//

    nameviewTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [nameviewTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    nameviewTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:nameviewTextBox];
    
    NSString *   labelText = [TSLanguageManager localizedString:@"UserName"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    
    NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    txtfname.frame = CGRectMake(10,0, nameviewTextBox.frame.size.width-20, 51);
    txtfname.delegate=self;
    txtfname.backgroundColor = [UIColor clearColor];
    txtfname.layer.cornerRadius=1.0;
    [txtfname setAttributedPlaceholder:attributedString];
    txtfname.autocorrectionType = UITextAutocorrectionTypeNo;
    txtfname.returnKeyType=UIReturnKeyNext;
    [nameviewTextBox addSubview:txtfname];
//    [APP_DELEGATE addTextFieldBottomColorr:txtfname];
    
    NSString * strFirstname = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"full_name"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"full_name"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"full_name"]isEqualToString:@""]){
        strFirstname = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"full_name"]];
    }

    txtfname.text = strFirstname;
    //==============================================//
    
    //================== Language ================//
    
    yy = yy + nameviewTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Language"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];

    imgLanguageTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgLanguageTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgLanguageTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgLanguageTextBox];
    
    txtLanguage.frame = CGRectMake(10,0, imgLanguageTextBox.frame.size.width-20, 50);
    txtLanguage.delegate=self;
    txtLanguage.textColor = [UIColor blackColor];
    txtLanguage.backgroundColor = [UIColor clearColor];
    txtLanguage.layer.cornerRadius=1.0;
    txtLanguage.font=[UIFont systemFontOfSize:15];
    txtLanguage.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtLanguage setAttributedPlaceholder:attributedString];
    txtLanguage.userInteractionEnabled = NO;
    [imgLanguageTextBox addSubview:txtLanguage];
    
    btnChangeLanguage.frame = CGRectMake(imgLanguageTextBox.frame.size.width-100, 0, 100, 50);
    [btnChangeLanguage setTitle:[TSLanguageManager localizedString:@"Change"] forState:UIControlStateNormal];
    btnChangeLanguage.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Italic" size:20.0];
    btnChangeLanguage.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [btnChangeLanguage setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [btnChangeLanguage addTarget:self action:@selector(btnChangeLanguageClikced:) forControlEvents:UIControlEventTouchUpInside];
    [imgLanguageTextBox addSubview:btnChangeLanguage];
    
    NSLog(@"Presentlan==>%@",[TSLanguageManager selectedLanguage]);

    
    NSString * strLanguage = [TSLanguageManager selectedLanguage];
    
//    if([[dicDetails valueForKey:@"profile"]valueForKey:@"lang"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"lang"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"lang"]isEqualToString:@""]){
//        strLanguage = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"lang"]];
//        if ([strLanguage isEqualToString:@"en"]) {
//            strLanguage = @"English";
//        }
//        else{
//            strLanguage = @"Spanish";
//        }
//    }
            if ([strLanguage isEqualToString:@"en"]) {
                strLanguage = @"English";
            }
            else{
                strLanguage = @"Spanish";
            }
    txtLanguage.text = strLanguage;
    //==============================================//
    
    //================== Sex ================//
    
    yy = yy + imgLanguageTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Sex"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgSexTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgSexTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgSexTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgSexTextBox];
    
    txtSex.frame = CGRectMake(10,0, imgSexTextBox.frame.size.width-20, 50);
    txtSex.delegate=self;
    txtSex.textColor = [UIColor blackColor];
    txtSex.backgroundColor = [UIColor clearColor];
    txtSex.layer.cornerRadius=1.0;
    txtSex.font=[UIFont systemFontOfSize:15];
    txtSex.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtSex setAttributedPlaceholder:attributedString];
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgSexTextBox addSubview:txtSex];
    
    
    btnSex.backgroundColor=[UIColor clearColor];
    [btnSex addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSex.frame=txtSex.frame;
    btnSex.tag = 0;
    [imgSexTextBox addSubview:btnSex];
    
    NSString * strSex = @"";
    
//    if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {

    if([[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]isEqualToString:@""]){
        
        strSex = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]];
        }
    
    if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            if ([strSex isEqualToString:@"M"]) {
            strSex = [[arrSex objectAtIndex:0]valueForKey:@"English_name"];
            }
            else{
            strSex = [[arrSex objectAtIndex:1]valueForKey:@"English_name"];
            }
        }else{
            if ([strSex isEqualToString:@"M"]) {
                strSex = [[arrSex objectAtIndex:0]valueForKey:@"Spanish_name"];
            }
            else{
                strSex = [[arrSex objectAtIndex:1]valueForKey:@"Spanish_name"];
            }
        }
    
    txtSex.text = strSex;
    
    imgSexDownArrow.frame  = CGRectMake(txtSex.frame.size.width-20, (txtSex.frame.size.height/2)-(12/2), 15, 12);
    imgSexDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSex addSubview:imgSexDownArrow];

    selectedSexHeight = yy;

    //==============================================//
    
    //================== SexOrienation ================//
    
    yy = yy + imgSexTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Sexual Orientation"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgSexOrienationTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgSexOrienationTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgSexOrienationTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgSexOrienationTextBox];
    
    txtSexOrientation.frame =CGRectMake(10,0, imgSexOrienationTextBox.frame.size.width-20, 50);
    txtSexOrientation.delegate=self;
    txtSexOrientation.textColor = [UIColor blackColor];
    txtSexOrientation.backgroundColor = [UIColor clearColor];
    txtSexOrientation.layer.cornerRadius=1.0;
    txtSexOrientation.font=[UIFont systemFontOfSize:15];
    txtSexOrientation.autocorrectionType = UITextAutocorrectionTypeNo;
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [txtSexOrientation setAttributedPlaceholder:attributedString];
    [imgSexOrienationTextBox addSubview:txtSexOrientation];
    
    NSString * strSexorientation = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"sexual_orientation"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"sexual_orientation"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"sexual_orientation"]isEqualToString:@""]){
        strSexorientation = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"sexual_orientation"]];

    }
    
    for(int i=0; i<[arrGendorOreintation count]; i++)
    {
        if ([[[arrGendorOreintation objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strSexorientation])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strSexorientation = [[arrGendorOreintation objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strSexorientation = [[arrGendorOreintation objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strSexorientation);
        }
    }

    txtSexOrientation.text = strSexorientation;
    
    imgSexorientaionDownArrow.frame  = CGRectMake(txtSex.frame.size.width-20, (txtSex.frame.size.height/2)-(12/2), 15, 12);
    imgSexorientaionDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSexOrientation addSubview:imgSexorientaionDownArrow];
    
    
    btnSexOrient.backgroundColor=[UIColor clearColor];
    btnSexOrient.tag = 1;
    [btnSexOrient addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSexOrient.frame = CGRectMake(10,0, imgSexOrienationTextBox.frame.size.width-20, 50);
    [imgSexOrienationTextBox addSubview:btnSexOrient];
    
    selectedSexualOrientationHeight = yy;
    //==============================================//
    
    //================== Birthday ================//
    
    
    labelText = [TSLanguageManager localizedString:@"Birthday"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    yy = yy+imgSexOrienationTextBox.frame.size.height+5;
    
    imgBirthdayTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgBirthdayTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgBirthdayTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgBirthdayTextBox];
    
    txtBirthDay.frame = CGRectMake(10,0,imgBirthdayTextBox.frame.size.width-20, 50);
    txtBirthDay.delegate=self;
    txtBirthDay.textColor = [UIColor blackColor];
    txtBirthDay.backgroundColor = [UIColor clearColor];
    txtBirthDay.layer.cornerRadius=1.0;
    txtBirthDay.font=[UIFont systemFontOfSize:15];
    txtBirthDay.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtBirthDay setAttributedPlaceholder:attributedString];

    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgBirthdayTextBox addSubview:txtBirthDay];
    
    NSString * strBirthday = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"date_of_birth"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"date_of_birth"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"date_of_birth"]isEqualToString:@""]){
        strBirthday = [NSString stringWithFormat:@"%@",[self todatetimonly:[[dicDetails valueForKey:@"profile"]valueForKey:@"date_of_birth"]]];
        selectedDate = strBirthday;
    }
    
    txtBirthDay.text = strBirthday;
    
    
     imgBirthDownArrow.frame = CGRectMake(txtBirthDay.frame.size.width-20, (txtBirthDay.frame.size.height/2)-(12/2), 15, 12);
    imgBirthDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtBirthDay addSubview:imgBirthDownArrow];
    
    
    
    btnDate.backgroundColor=[UIColor clearColor];
    [btnDate addTarget:self action:@selector(btnBirthdateClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnDate.frame=txtBirthDay.frame;
    [imgBirthdayTextBox addSubview:btnDate];
    
    selectedBirthdayHeight = yy;

    //==============================================//
    
    //================== Body ================//
    
    
    labelText = [TSLanguageManager localizedString:@"Body"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    yy = yy+imgBirthdayTextBox.frame.size.height+5;
    
    imgBodyTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgBodyTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgBodyTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgBodyTextBox];
    
    txtBody.frame = CGRectMake(10,0, imgBodyTextBox.frame.size.width-20, 50);
    txtBody.delegate=self;
    txtBody.textColor = [UIColor blackColor];
    txtBody.backgroundColor = [UIColor clearColor];
    txtBody.layer.cornerRadius=1.0;
    txtBody.font=[UIFont systemFontOfSize:15];
    txtBody.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtBody setAttributedPlaceholder:attributedString];
    
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgBodyTextBox addSubview:txtBody];
    
    NSString * strBody = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"body_type"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"body_type"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"body_type"]isEqualToString:@""])
    {
        strBody = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"body_type"]];
    }
    
    for(int i=0; i<[arrBody count]; i++)
    {
        if ([[[arrBody objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strBody])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strBody = [[arrBody objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strBody = [[arrBody objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strBody);
        }
    }
    
    txtBody.text = strBody;
    
    imageBodyDropdown.frame  = CGRectMake(txtBody.frame.size.width-20, (txtBody.frame.size.height/2)-(12/2), 15, 12);
    imageBodyDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtBody addSubview:imageBodyDropdown];
    
    
    btnBody.backgroundColor=[UIColor clearColor];
    [btnBody addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnBody.frame=txtBody.frame;
    btnBody.tag = 2;
    [imgBodyTextBox addSubview:btnBody];
    
    selectedBodyHeight = yy;

    //==============================================//

    
    //================== Eyes ================//
    
    yy = yy+imgBodyTextBox.frame.size.height+5;
    
    
    labelText = [TSLanguageManager localizedString:@"Eyes"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgEyesTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgEyesTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgEyesTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgEyesTextBox];
    
    txtEyes.frame = CGRectMake(10,0, imgEyesTextBox.frame.size.width-20, 50);
    txtEyes.delegate=self;
    txtEyes.textColor = [UIColor blackColor];
    txtEyes.backgroundColor = [UIColor clearColor];
    txtEyes.layer.cornerRadius=1.0;
    txtEyes.font=[UIFont systemFontOfSize:15];
    txtEyes.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtEyes setAttributedPlaceholder:attributedString];
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgEyesTextBox addSubview:txtEyes];
    
    NSString * strEyes = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"eyes"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"eyes"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"eyes"]isEqualToString:@""]){
        strEyes = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"eyes"]];
    }
    
    for(int i=0; i<[arrEyes count]; i++)
    {
        if ([[[arrEyes objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strEyes])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strEyes = [[arrEyes objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strEyes = [[arrEyes objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strEyes);
        }
    }
    
    txtEyes.text = strEyes;
    
    imageEyeDropdown.frame  = CGRectMake(txtBody.frame.size.width-20, (txtEyes.frame.size.height/2)-(12/2), 15, 12);
    imageEyeDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtEyes addSubview:imageEyeDropdown];
    
    
    btnEyes.backgroundColor=[UIColor clearColor];
    [btnEyes addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnEyes.frame=txtBody.frame;
    btnEyes.tag = 3;
    [imgEyesTextBox addSubview:btnEyes];

    selectedEyeHeight = yy;

    //==============================================//
    //================== Hair ================//
    labelText = [TSLanguageManager localizedString:@"Hair"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    yy = yy+imgEyesTextBox.frame.size.height+5;
    
    imgHairTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgHairTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgHairTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgHairTextBox];
    
    txtHair.frame = CGRectMake(10,0,imgHairTextBox.frame.size.width-20, 50);
    txtHair.delegate=self;
    txtHair.textColor = [UIColor blackColor];
    txtHair.backgroundColor = [UIColor clearColor];
    txtHair.layer.cornerRadius=1.0;
    txtHair.font=[UIFont systemFontOfSize:15];
    txtHair.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtHair setAttributedPlaceholder:attributedString];
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgHairTextBox addSubview:txtHair];
   
    NSString * strhair = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"hair"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"hair"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"hair"]isEqualToString:@""]){
        strhair = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"hair"]];
    }
    
    for(int i=0; i<[arrHair count]; i++)
    {
        if ([[[arrHair objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strhair])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strhair = [[arrHair objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strhair = [[arrHair objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strhair);
        }
    }
    
    imageHairDropdown.frame  = CGRectMake(txtHair.frame.size.width-20, (txtHair.frame.size.height/2)-(12/2), 15, 12);
    imageHairDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtHair addSubview:imageHairDropdown];
    
    txtHair.text = strhair;
    
   
    btnHair.backgroundColor=[UIColor clearColor];
    [btnHair addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnHair.frame=txtBirthDay.frame;
    btnHair.tag = 4;
    [imgHairTextBox addSubview:btnHair];
    
    selectedHairHeight = yy;

    //==============================================//
    
    //================== Skin ================//
    
    yy = yy+imgHairTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Skin"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgSkinTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgSkinTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgSkinTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgSkinTextBox];
    
    txtSkin.frame = CGRectMake(10,0,imgSkinTextBox.frame.size.width-20, 50);
    txtSkin.delegate=self;
    txtSkin.textColor = [UIColor blackColor];
    txtSkin.backgroundColor = [UIColor clearColor];
    txtSkin.layer.cornerRadius=1.0;
    txtSkin.font=[UIFont systemFontOfSize:15];
    txtSkin.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtSkin setAttributedPlaceholder:attributedString];

    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgSkinTextBox addSubview:txtSkin];
    
    NSString * strSkin = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"skin"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"skin"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"skin"]isEqualToString:@""]){
        strSkin = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"skin"]];
    }
    
    for(int i=0; i<[arrSkin count]; i++)
    {
        if ([[[arrSkin objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strSkin])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strSkin = [[arrSkin objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strSkin = [[arrSkin objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strSkin);
        }
    }
    
    imageSkinDropdown.frame  = CGRectMake(txtSkin.frame.size.width-20, (txtSkin.frame.size.height/2)-(12/2), 15, 12);
    imageSkinDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSkin addSubview:imageSkinDropdown];

    txtSkin.text = strSkin;
    
   
    btnSkin.backgroundColor=[UIColor clearColor];
    [btnSkin addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSkin.frame=txtBirthDay.frame;
    btnSkin.tag = 5;
    [imgSkinTextBox addSubview:btnSkin];
    
    selectedSkinHeight = yy;

    //==============================================//
    
    //================== CivilStatus ================//
    
    yy = yy+imgSkinTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Civil status"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgCivilStatusTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgCivilStatusTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgCivilStatusTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgCivilStatusTextBox];
    
    txtCivilStatus.frame = CGRectMake(10,0,imgCivilStatusTextBox.frame.size.width-20, 50);
    txtCivilStatus.delegate=self;
    txtCivilStatus.textColor = [UIColor blackColor];
    txtCivilStatus.backgroundColor = [UIColor clearColor];
    txtCivilStatus.layer.cornerRadius=1.0;
    txtCivilStatus.font=[UIFont systemFontOfSize:15];
    txtCivilStatus.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtCivilStatus setAttributedPlaceholder:attributedString];
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgCivilStatusTextBox addSubview:txtCivilStatus];
    
    NSString * strCivilStatus = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"marital_status"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"marital_status"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"marital_status"]isEqualToString:@""]){
        strCivilStatus = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"marital_status"]];
    }
    
    for(int i=0; i<[arrCivilStatus count]; i++)
    {
        if ([[[arrCivilStatus objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strCivilStatus])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strCivilStatus = [[arrCivilStatus objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strCivilStatus = [[arrCivilStatus objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strCivilStatus);
        }
    }
    
    imageCivilStatusDropdown.frame  = CGRectMake(txtSkin.frame.size.width-20, (txtSkin.frame.size.height/2)-(12/2), 15, 12);
    imageCivilStatusDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtCivilStatus addSubview:imageCivilStatusDropdown];
    
    
    
    btnCivilStatus.backgroundColor=[UIColor clearColor];
    [btnCivilStatus addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCivilStatus.frame=txtBirthDay.frame;
    btnCivilStatus.tag = 6;
    [imgCivilStatusTextBox addSubview:btnCivilStatus];

    selectedCivilstatusHeight = yy;
    txtCivilStatus.text = strCivilStatus;
    //==============================================//
    
    //================== ShoolLevel ================//
    
    yy = yy+imgCivilStatusTextBox.frame.size.height+5;
    
    
    labelText = [TSLanguageManager localizedString:@"School level"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgShoolLevelTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgShoolLevelTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgShoolLevelTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgShoolLevelTextBox];
    
    txtSchool.frame = CGRectMake(10,0,imgShoolLevelTextBox.frame.size.width-20, 50);
    txtSchool.delegate=self;
    txtSchool.textColor = [UIColor blackColor];
    txtSchool.backgroundColor = [UIColor clearColor];
    txtSchool.layer.cornerRadius=1.0;
    txtSchool.font=[UIFont systemFontOfSize:15];
    txtSchool.autocorrectionType = UITextAutocorrectionTypeNo;
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [txtSchool setAttributedPlaceholder:attributedString];

    [imgShoolLevelTextBox addSubview:txtSchool];
    
    NSString * strSchool = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"highest_school_level"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"highest_school_level"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"highest_school_level"]isEqualToString:@""]){
        strSchool = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"highest_school_level"]];
    }
    
    for(int i=0; i<[arrSchool count]; i++)
    {
        if ([[[arrSchool objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strSchool])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strSchool = [[arrSchool objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strSchool = [[arrSchool objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strSchool);
        }
    }
    
    imageSchoolDropdown.frame  = CGRectMake(txtSchool.frame.size.width-20, (txtSchool.frame.size.height/2)-(12/2), 15, 12);
    imageSchoolDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSchool addSubview:imageSchoolDropdown];

   
    btnSchool.backgroundColor=[UIColor clearColor];
    [btnSchool addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSchool.frame=txtBirthDay.frame;
    btnSchool.tag = 7;
    [imgShoolLevelTextBox addSubview:btnSchool];
    
    selectedSchoolHeight = yy;
    txtSchool.text = strSchool;
    //==============================================//
    
    //================== Profession ================//
    
    yy = yy+imgShoolLevelTextBox.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Profession"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgProfessionTextbox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgProfessionTextbox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgProfessionTextbox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgProfessionTextbox];
    
    txtCivilProvision.frame = CGRectMake(10,0,imgProfessionTextbox.frame.size.width-20, 50);
    txtCivilProvision.delegate=self;
    txtCivilProvision.textColor = [UIColor blackColor];
    txtCivilProvision.backgroundColor = [UIColor clearColor];
    txtCivilProvision.layer.cornerRadius=1.0;
    txtCivilProvision.font=[UIFont systemFontOfSize:15];
    txtCivilProvision.autocorrectionType = UITextAutocorrectionTypeNo;
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [txtCivilProvision setAttributedPlaceholder:attributedString];

    [imgProfessionTextbox addSubview:txtCivilProvision];
    
    NSString * strCivilProvision = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"occupation"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"occupation"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"occupation"]isEqualToString:@""]){
        strCivilProvision = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"occupation"]];
    }
    
    selectedProvisionHeight = yy;
    
    txtCivilProvision.text = strCivilProvision;
    //==============================================//
    
    //================== City ================//
    
    yy = yy+imgProfessionTextbox.frame.size.height+5;
    
    
    labelText = [TSLanguageManager localizedString:@"City"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgCityTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgCityTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgCityTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgCityTextBox];
    
    txtCity.frame = CGRectMake(10,0, imgCityTextBox.frame.size.width-20, 50);
    txtCity.delegate=self;
    txtCity.textColor = [UIColor blackColor];
    txtCity.backgroundColor = [UIColor clearColor];
    txtCity.layer.cornerRadius=1.0;
    txtCity.font=[UIFont systemFontOfSize:15];
    txtCity.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtCity setAttributedPlaceholder:attributedString];

    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgCityTextBox addSubview:txtCity];
    
    NSString * strCity = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"city"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"city"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"city"]isEqualToString:@""]){
        strCity = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"city"]];
    }
    
    selectedCityHeight = yy;

    txtCity.text = strCity;

    //==============================================//
    
    //================== Country ================//
    
    yy = yy+imgCityTextBox.frame.size.height+5;
    
    
    labelText = [TSLanguageManager localizedString:@"Country"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    
    imgCountryTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgCountryTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgCountryTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgCountryTextBox];
    
    txtCountry.frame = CGRectMake(10,0,imgCountryTextBox.frame.size.width-20, 50);
    txtCountry.delegate=self;
    txtCountry.textColor = [UIColor blackColor];
    txtCountry.backgroundColor = [UIColor clearColor];
    txtCountry.layer.cornerRadius=1.0;
    txtCountry.font=[UIFont systemFontOfSize:15];
    txtCountry.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtCountry setAttributedPlaceholder:attributedString];

    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgCountryTextBox addSubview:txtCountry];
    NSString * strCountry = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"country"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"country"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"country"]isEqualToString:@""]){
        strCountry = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"country"]];
    }
    
    for(int i=0; i<[arrCountry count]; i++)
    {
        if ([[[arrCountry objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strCountry])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strCountry = [[arrCountry objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strCountry = [[arrCountry objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strCountry);
        }
    }
    
    imageCountryDropdown.frame  = CGRectMake(txtCountry.frame.size.width-20,(txtCountry.frame.size.height/2)-(12/2), 15, 12);
    imageCountryDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtCountry addSubview:imageCountryDropdown];

   
    btnCountry.backgroundColor=[UIColor clearColor];
    [btnCountry addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCountry.frame=txtBirthDay.frame;
    btnCountry.tag = 8;
    [imgCountryTextBox addSubview:btnCountry];

    selectedCountryHeight = yy;
    txtCountry.text = strCountry;
    
    //==============================================//

    //================== State/provision ================//

    StartForStateandProvience = yy+imgCountryTextBox.frame.size.height+5;
    
    NSLog(@"StartForStateandProvience==>%ld",(long)StartForStateandProvience);
    
    if ([strCountry isEqualToString:@"Cuba"] || [strCountry isEqualToString:@"U.S.A"] || [strCountry isEqualToString:@"Estados Unidos"]) {
        
         yy = yy+imgCountryTextBox.frame.size.height+5;NSLog(@"StartForStateandProvience==>%ld",(long)StartForStateandProvience);
        
        NSString * strProvience = @"";
        if ([strCountry isEqualToString:@"Cuba"]) {
            strCountryKeyWord = @"CU";
            labelText = [TSLanguageManager localizedString:@"Province"];
            
            if([[dicDetails valueForKey:@"profile"]valueForKey:@"province"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"province"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"province"]isEqualToString:@""]){
                strProvience = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"province"]];
            }
            
            for(int i=0; i<[arrProvience count]; i++)
            {
                if ([[[arrProvience objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strProvience])
                {
                    if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                        strProvience = [[arrProvience objectAtIndex:i]valueForKey:@"English_name"];
                    }
                    else{
                        strProvience = [[arrProvience objectAtIndex:i]valueForKey:@"Spanish_name"];
                    }
                    NSLog(@"index==>%@",strProvience);
                }
            }
        }else{
            strCountryKeyWord = @"US";

            //StartForStateandProvience = yy;
             NSLog(@"StartForStateandProvience==>%ld",(long)StartForStateandProvience);
            labelText = [TSLanguageManager localizedString:@"State"];
            
            if([[dicDetails valueForKey:@"profile"]valueForKey:@"usstate"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"usstate"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"usstate"]isEqualToString:@""]){
                strProvience = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"usstate"]];
            }
            
            for(int i=0; i<[arrStates count]; i++)
            {
                if ([[[arrStates objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strProvience])
                {
                    if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                        strProvience = [[arrStates objectAtIndex:i]valueForKey:@"English_name"];
                    }
                    else{
                        strProvience = [[arrStates objectAtIndex:i]valueForKey:@"Spanish_name"];
                    }
                    NSLog(@"index==>%@",strProvience);
                }
            }
        }
         attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
         paragraphStyle =[[NSMutableParagraphStyle alloc] init];
         [paragraphStyle setLineSpacing:0.1];
         [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
         [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
         [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
         
         imgStateTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
         imgStateTextBox.hidden = NO;
         [imgStateTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
         imgStateTextBox.userInteractionEnabled = YES;
         [scrlContent addSubview:imgStateTextBox];
         
         txtState.frame = CGRectMake(10,0, imgStateTextBox.frame.size.width-20, 50);
         txtState.delegate=self;
         txtState.textColor = [UIColor blackColor];
         txtState.backgroundColor = [UIColor clearColor];
         txtState.layer.cornerRadius=1.0;
         txtState.font=[UIFont systemFontOfSize:15];
         txtState.autocorrectionType = UITextAutocorrectionTypeNo;
         //txtLanguage.returnKeyType=UIReturnKeyNext;
        [txtState setAttributedPlaceholder:attributedString];

         [imgStateTextBox addSubview:txtState];
        
        imageStateDropdown.frame  = CGRectMake(txtCountry.frame.size.width-20,(txtCountry.frame.size.height/2)-(12/2), 15, 12);
        imageStateDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
        [txtState addSubview:imageStateDropdown];
        
        txtState.text = strProvience;
        
        
        btnProvience.backgroundColor=[UIColor clearColor];
        [btnProvience addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
        btnProvience.frame=txtState.frame;
        
          if ([strCountry isEqualToString:@"Cuba"]) {
              btnProvience.tag = 9;
          }else{
              btnProvience.tag = 10;
          }
        [imgStateTextBox addSubview:btnProvience];
        
        selectedPrivienceHeight = yy;
    }
    
    //==============================================//

    //================== Interst ================//
    
    yy = yy+imgCountryTextBox.frame.size.height+5;
    
    StartForIntrest = yy;
    NSLog(@"StartForIntrest==>%ld",(long)StartForIntrest);

   /* labelText = [TSLanguageManager localizedString:@"Interests"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    txtinterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, 50);
    txtinterst.delegate=self;
    txtinterst.textColor = [UIColor blackColor];
    txtinterst.backgroundColor = [UIColor clearColor];
    txtinterst.layer.cornerRadius=1.0;
    txtinterst.font=[UIFont systemFontOfSize:15];
    txtinterst.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtinterst setAttributedPlaceholder:attributedString];
    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgInterstTextBox addSubview:txtinterst];*/
    imgInterstTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgInterstTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgInterstTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgInterstTextBox];
    
    lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, 50);
    lblInterst.text = [TSLanguageManager localizedString:@"Interests"];
    lblInterst.layer.cornerRadius=3.0;
    lblInterst.userInteractionEnabled = YES;
    lblInterst.textColor = [UIColor grayColor];
    lblInterst.backgroundColor = [UIColor clearColor];
    lblInterst.font = [UIFont systemFontOfSize:15];
    lblInterst.numberOfLines = 0;
    
    NSString * strinterst = @"";
    
    if ([[dicDetails valueForKey:@"profile"]valueForKey:@"interests"]) {
        NSArray * arrtags = [[dicDetails valueForKey:@"profile"]valueForKey:@"interests"];
        if ([arrtags count]>0){
            strinterst = [arrtags componentsJoinedByString:@","];
            lblInterst.textColor = [UIColor blackColor];
            arrInterstSelection = [arrtags mutableCopy];
        }
    }
        CGSize IntrestSize = [APP_DELEGATE getSizeForText:lblInterst.text andWidth:scrlContent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:15];
    if (IntrestSize.height<50) {
        IntrestSize.height = 50;
    }
        [imgInterstTextBox setFrame:CGRectMake(20, yy, scrlContent.frame.size.width-40, IntrestSize.height)];
    lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, imgInterstTextBox.frame.size.height);
    
        lblInterst.text = strinterst;
        [imgInterstTextBox addSubview:lblInterst];
    
    if ([lblInterst.text isEqualToString:@""]) {
        lblInterst.text = [TSLanguageManager localizedString:@"Interests"];
    }
    
 
    btnIntrest.backgroundColor=[UIColor clearColor];
    [btnIntrest addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnIntrest.frame=lblInterst.frame;
    btnIntrest.tag = 12;
    [imgInterstTextBox addSubview:btnIntrest];

    //==============================================//
    
    //================== Religion ================//
    
    yy = yy+lblInterst.frame.size.height+5;
    
    labelText = [TSLanguageManager localizedString:@"Religion"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    imgReligionTextBox.frame = CGRectMake(20,yy,scrlContent.frame.size.width-40, 50);
    [imgReligionTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
    imgReligionTextBox.userInteractionEnabled = YES;
    [scrlContent addSubview:imgReligionTextBox];
    
    txtReligion.frame = CGRectMake(10,0, imgReligionTextBox.frame.size.width-20, 50);
    txtReligion.delegate=self;
    txtReligion.textColor = [UIColor blackColor];
    txtReligion.backgroundColor = [UIColor clearColor];
    txtReligion.layer.cornerRadius=1.0;
    txtReligion.font=[UIFont systemFontOfSize:15];
    txtReligion.autocorrectionType = UITextAutocorrectionTypeNo;
    [txtReligion setAttributedPlaceholder:attributedString];

    //txtLanguage.returnKeyType=UIReturnKeyNext;
    [imgReligionTextBox addSubview:txtReligion];
    
    btnReligion.backgroundColor=[UIColor clearColor];
    [btnReligion addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnReligion.frame=txtReligion.frame;
    btnReligion.tag = 11;
    [imgReligionTextBox addSubview:btnReligion];
    
    NSString * strReligion = @"";
    
    if([[dicDetails valueForKey:@"profile"]valueForKey:@"religion"]!=nil && [[dicDetails valueForKey:@"profile"]valueForKey:@"religion"]!=[NSNull null] && ![[[dicDetails valueForKey:@"profile"]valueForKey:@"religion"]isEqualToString:@""]){
        strReligion = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"religion"]];
    }
   
    for(int i=0; i<[arrReligion count]; i++)
    {
        if ([[[arrReligion objectAtIndex:i]valueForKey:@"KeyWord"] isEqualToString:strReligion])
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
                strReligion = [[arrReligion objectAtIndex:i]valueForKey:@"English_name"];
            }
            else{
                strReligion = [[arrReligion objectAtIndex:i]valueForKey:@"Spanish_name"];
            }
            NSLog(@"index==>%@",strReligion);
        }
    }

    txtReligion.text = strReligion;

    imageReligionDropdown.frame  = CGRectMake(txtReligion.frame.size.width-20, (txtReligion.frame.size.height/2)-(12/2), 15, 12);
    imageReligionDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtReligion addSubview:imageReligionDropdown];
    
    selectedReligionHeight = yy;

    //==============================================//

    //================== SaveButton ================//
    
    yy = yy+imgReligionTextBox.frame.size.height+8;
    
    btnContinue.frame = CGRectMake(20,yy, scrlContent.frame.size.width-40,45);
    [btnContinue setTitle:[TSLanguageManager localizedString:@"Save"] forState:UIControlStateNormal];
    [btnContinue setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];
    btnContinue.layer.cornerRadius = 5.0;
    [btnContinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnContinue.clipsToBounds = YES;
    [btnContinue addTarget:self action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnContinue.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    [activityIndicatorForSave setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
    [btnContinue addSubview:activityIndicatorForSave];
    
    [scrlContent addSubview:btnContinue];
    //==============================================//
    
    //================== StoreButton ================//
    
    yy = yy+btnContinue.frame.size.height+8;
   
    btnStoreButton.frame = CGRectMake(20,yy, scrlContent.frame.size.width-40,45);
    [btnStoreButton setTitle:[TSLanguageManager localizedString:@"Store"] forState:UIControlStateNormal];
    [btnStoreButton setBackgroundImage:[UIImage imageNamed:@"txtbox_icon.png"] forState:UIControlStateNormal];
    [btnStoreButton setImage :[UIImage imageNamed:@"Shopping-Cart.png"] forState:UIControlStateNormal];
    btnStoreButton.layer.cornerRadius = 5.0;
    [btnStoreButton setTitleColor:darkGayColor forState:UIControlStateNormal];
    btnStoreButton.clipsToBounds = YES;
    [btnStoreButton addTarget:self action:@selector(btnStoreClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnStoreButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [scrlContent addSubview:btnStoreButton];
    //==============================================//
    
    //================== logoutButton ================//
    
    yy = yy+btnStoreButton.frame.size.height+8;
    
    btnlogoutButton.frame = CGRectMake(20,yy, scrlContent.frame.size.width-40,45);
    [btnlogoutButton setTitle:[TSLanguageManager localizedString:@"Logout"] forState:UIControlStateNormal];
    [btnlogoutButton setBackgroundImage:[UIImage imageNamed:@"txtbox_icon.png"] forState:UIControlStateNormal];
    btnlogoutButton.layer.cornerRadius = 5.0;
    [btnlogoutButton setTitleColor:darkGayColor forState:UIControlStateNormal];
    btnlogoutButton.clipsToBounds = YES;
    [btnlogoutButton addTarget:self action:@selector(btnlogoutClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnlogoutButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [activityIndicatorForlogout setFrame:CGRectMake(btnlogoutButton.frame.size.width-40, 5, 30, 30)];
    [btnlogoutButton addSubview:activityIndicatorForlogout];
    
    [scrlContent addSubview:btnlogoutButton];
    //==============================================//
    yy = yy+btnlogoutButton.frame.size.height+8;

    [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, yy+5)];
    scrlContent.showsHorizontalScrollIndicator=NO;
    scrlContent.showsVerticalScrollIndicator=NO;
    scrlContent.scrollEnabled=YES;
}

#pragma mark - TextFieldButtonClicked

-(void)btnSexClicked:(id)sender
{
    [self hideKeyboard];
    
    if ([sender tag]==0)
    {
        [self showPicker:YES andView:viewGendor];
        [scrlContent setContentOffset:CGPointMake(0, selectedSexHeight-100) animated:YES];
    }
    else if ([sender tag]==1)
    {
        [self showPicker:YES andView:viewGendorOrentation];
        [scrlContent setContentOffset:CGPointMake(0,selectedSexualOrientationHeight-150) animated:YES];
    }
    else if ([sender tag]==2)
    {
        [self showPicker:YES andView:viewBody];
        [scrlContent setContentOffset:CGPointMake(0,selectedBodyHeight-150) animated:YES];
    }
    else if ([sender tag]==3)
    {
        [self showPicker:YES andView:viewEyes];
        [scrlContent setContentOffset:CGPointMake(0,selectedEyeHeight-150) animated:YES];
    }
    else if ([sender tag]==4)
    {
        [self showPicker:YES andView:viewHair];
        [scrlContent setContentOffset:CGPointMake(0,selectedHairHeight-150) animated:YES];
    }
    else if ([sender tag]==5)
    {
        [self showPicker:YES andView:viewSkin];
        [scrlContent setContentOffset:CGPointMake(0,selectedSkinHeight-150) animated:YES];
    }
    else if ([sender tag]==6)
    {
        [self showPicker:YES andView:viewCivilstatus];
        [scrlContent setContentOffset:CGPointMake(0,selectedCivilstatusHeight-150) animated:YES];
    }
    else if ([sender tag]==7)
    {
        [self showPicker:YES andView:viewSchoolstatus];
        [scrlContent setContentOffset:CGPointMake(0,selectedSchoolHeight-150) animated:YES];
    }
    else if ([sender tag]==8)
    {
        [self showPicker:YES andView:viewCountrys];
        [scrlContent setContentOffset:CGPointMake(0,selectedCountryHeight-150) animated:YES];
    }
    else if ([sender tag]==9)
    {
        [self showPicker:YES andView:viewProvilence];
        [scrlContent setContentOffset:CGPointMake(0,selectedPrivienceHeight-150) animated:YES];
    }
    else if ([sender tag]==10)
    {
        [self showPicker:YES andView:viewStates];
        [scrlContent setContentOffset:CGPointMake(0,selectedPrivienceHeight-150) animated:YES];
    }
    else if ([sender tag]==11)
    {
        [self showPicker:YES andView:viewReligion];
        [scrlContent setContentOffset:CGPointMake(0,selectedReligionHeight-150) animated:YES];
    }
    else if ([sender tag]==12)
    {
        [self SetInrestSelction];

    }
}

#pragma mark hideKeyboard
-(void)hideKeyboard
{
    [txtfname resignFirstResponder];
    [txtCivilProvision resignFirstResponder];
    [txtCity resignFirstResponder];
    
    [self showPicker:NO andView:viewBirthday];
    [self showPicker:NO andView:viewGendor];
    [self showPicker:NO andView:viewGendorOrentation];
    [self showPicker:NO andView:viewBody];
    [self showPicker:NO andView:viewEyes];
    [self showPicker:NO andView:viewHair];
    [self showPicker:NO andView:viewSkin];
    [self showPicker:NO andView:viewCivilstatus];
    [self showPicker:NO andView:viewSchoolstatus];
    [self showPicker:NO andView:viewCountrys];
    [self showPicker:NO andView:viewProvilence];
    [self showPicker:NO andView:viewStates];
    [self showPicker:NO andView:viewReligion];

    //[scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];
}
-(void)setDetailPickerViews
{
    viewGendor = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewGendor setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewGendor];
    
    PickerGendor = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerGendor setBackgroundColor:[UIColor whiteColor]];
    PickerGendor.delegate=self;
    PickerGendor.dataSource=self;
    [viewGendor addSubview:PickerGendor];
    
    UIButton * btnDone3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone3 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone3 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone3 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone3 setTag:1];
    [btnDone3 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewGendor addSubview:btnDone3];
  
    viewGendorOrentation = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewGendorOrentation setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewGendorOrentation];
    
    PickerGendorOrientation = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerGendorOrientation setBackgroundColor:[UIColor whiteColor]];
    PickerGendorOrientation.delegate=self;
    PickerGendorOrientation.dataSource=self;
    [viewGendorOrentation addSubview:PickerGendorOrientation];
    
    UIButton * btnDoneOrentation = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDoneOrentation setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDoneOrentation setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDoneOrentation setTitle:@"Done" forState:UIControlStateNormal];
    [btnDoneOrentation setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDoneOrentation setTag:2];
    [btnDoneOrentation addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewGendorOrentation addSubview:btnDoneOrentation];
    
    viewBody = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewBody setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewBody];
    
    PickerBody = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerBody setBackgroundColor:[UIColor whiteColor]];
    PickerBody.delegate=self;
    PickerBody.dataSource=self;
    [viewBody addSubview:PickerBody];
    
    UIButton * btnDone4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone4 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone4 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone4 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone4 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone4 setTag:3];
    [btnDone4 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewBody addSubview:btnDone4];
    
    viewEyes = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewEyes setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewEyes];
    
    PickerEye = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerEye setBackgroundColor:[UIColor whiteColor]];
    PickerEye.delegate=self;
    PickerEye.dataSource=self;
    [viewEyes addSubview:PickerEye];
    
    UIButton * btnDone5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone5 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone5 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone5 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone5 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone5 setTag:4];
    [btnDone5 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewEyes addSubview:btnDone5];
    
    viewHair = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewHair setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewHair];
    
    PickerHair = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerHair setBackgroundColor:[UIColor whiteColor]];
    PickerHair.delegate=self;
    PickerHair.dataSource=self;
    [viewHair addSubview:PickerHair];
    
    UIButton * btnDone7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone7 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone7 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone7 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone7 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone7 setTag:5];
    [btnDone7 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewHair addSubview:btnDone7];
    
    viewSkin = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewSkin setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewSkin];
    
    PickerSkin = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerSkin setBackgroundColor:[UIColor whiteColor]];
    PickerSkin.delegate=self;
    PickerSkin.dataSource=self;
    [viewSkin addSubview:PickerSkin];
    
    UIButton * btnDone6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone6 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone6 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone6 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone6 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone6 setTag:6];
    [btnDone6 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewSkin addSubview:btnDone6];
    
    viewCivilstatus = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewCivilstatus setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewCivilstatus];
    
    PickerCivilStatus = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerCivilStatus setBackgroundColor:[UIColor whiteColor]];
    PickerCivilStatus.delegate=self;
    PickerCivilStatus.dataSource=self;
    [viewCivilstatus addSubview:PickerCivilStatus];
    
    UIButton * btnDone8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone8 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone8 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone8 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone8 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone8 setTag:7];
    [btnDone8 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewCivilstatus addSubview:btnDone8];
    
    viewSchoolstatus = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewSchoolstatus setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewSchoolstatus];
    
    PickerSchoolstatus = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerSchoolstatus setBackgroundColor:[UIColor whiteColor]];
    PickerSchoolstatus.delegate=self;
    PickerSchoolstatus.dataSource=self;
    [viewSchoolstatus addSubview:PickerSchoolstatus];
    
    UIButton * btnDone9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone9 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone9 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone9 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone9 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone9 setTag:8];
    [btnDone9 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewSchoolstatus addSubview:btnDone9];
    
    viewCountrys = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewCountrys setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewCountrys];
    
    PickerCountry = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerCountry setBackgroundColor:[UIColor whiteColor]];
    PickerCountry.delegate=self;
    PickerCountry.dataSource=self;
    [viewCountrys addSubview:PickerCountry];
    
    UIButton * btnDone10 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone10 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone10 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone10 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone10 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone10 setTag:9];
    [btnDone10 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewCountrys addSubview:btnDone10];

    
    viewProvilence = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewProvilence setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewProvilence];
    
    PickerProvilence = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerProvilence setBackgroundColor:[UIColor whiteColor]];
    PickerProvilence.delegate=self;
    PickerProvilence.dataSource=self;
    [viewProvilence addSubview:PickerProvilence];
    
    UIButton * btnDone11 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone11 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone11 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone11 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone11 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone11 setTag:10];
    [btnDone11 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewProvilence addSubview:btnDone11];
    
    viewStates = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewStates setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewStates];
    
    PickerStates = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerStates setBackgroundColor:[UIColor whiteColor]];
    PickerStates.delegate=self;
    PickerStates.dataSource=self;
    [viewStates addSubview:PickerStates];
    
    UIButton * btnDone12 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone12 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone12 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone12 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone12 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone12 setTag:11];
    [btnDone12 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewStates addSubview:btnDone12];
    
//    
    viewReligion = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewReligion setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewReligion];
    
    PickerReligion = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerReligion setBackgroundColor:[UIColor whiteColor]];
    PickerReligion.delegate=self;
    PickerReligion.dataSource=self;
    [viewReligion addSubview:PickerReligion];
    
    UIButton * btnDone13 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone13 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone13 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone13 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone13 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone13 setTag:12];
    [btnDone13 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewReligion addSubview:btnDone13];
    
    
    viewBirthday = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewBirthday setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewBirthday];
    
    UIButton * btnDone1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone1 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone1 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone1 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone1 setTag:1];
    [btnDone1 addTarget:self action:@selector(btnDoneClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewBirthday addSubview:btnDone1];
    
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    //    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    //[datePicker setMaximumDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY"];
    NSDate * currentDate = [NSDate date];
    NSDateComponents * comps = [[NSDateComponents alloc] init];
    [comps setYear: -18];
    NSDate * maxDate = [gregorian dateByAddingComponents: comps toDate: currentDate options: 0];
    [comps setYear: -75];
    NSDate * minDate = [gregorian dateByAddingComponents: comps toDate: currentDate options: 0];
    
    datePicker.minimumDate = minDate;
    datePicker.maximumDate = maxDate;
    NSString *dateStr = [dateFormatter stringFromDate:maxDate];
    if(![selectedDate isEqualToString:@""] && selectedDate!=nil){
        
    }else{
         selectedDate=dateStr;
    }
    NSLog(@"selectedDate====>%@",selectedDate);
    [datePicker setDate:[dateFormatter dateFromString:selectedDate]];
    [viewBirthday addSubview:datePicker];
}
-(void)btnDoneClicked:(id)sender
{
    if ([sender tag] == 1)
    {
        [self showPicker:NO andView:viewBirthday];
        
        NSDate * date = [datePicker date];
        
        NSDateFormatter * df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"dd/MM/YYYY"];
        selectedDate = [df stringFromDate:date];
        NSLog(@"selectedDate===%@",selectedDate);
        
        [txtBirthDay setText:selectedDate];
    }
    
    [self hideKeyboard];
    //    [self btnSexClicked:nil];
}

-(void)updateDate:(id)sender
{
    UIDatePicker *datePicker1 = (UIDatePicker *)sender;
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/YYYY"];
    NSLog(@"datePicker1.date--%@",datePicker1.date);
    selectedDate = [df stringFromDate: datePicker1.date];
    NSLog(@"selectedDate--%@",selectedDate);
    //txtBirthday.text=selectedDate;
}

-(void)GendarDoneclick:(id)sender
{
    if ([sender tag]==1)
    {
        [self pickerView:PickerGendor didSelectRow:intselectedGendor inComponent:0];
       // [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewGendor];
    }
    else if ([sender tag]==2)
    {
        [self pickerView:PickerGendorOrientation didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewGendorOrentation];
    }
    else if ([sender tag]==3)
    {
        [self pickerView:PickerBody didSelectRow:intselectedGendor inComponent:0];
       // [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewBody];
    }
    else if ([sender tag]==4)
    {
        [self pickerView:PickerEye didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewEyes];
    }else if ([sender tag]==5)
    {
        [self pickerView:PickerHair didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewHair];
    }else if ([sender tag]==6)
    {
        [self pickerView:PickerSkin didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewSkin];
    }
    else if ([sender tag]==7)
    {
        [self pickerView:PickerCivilStatus didSelectRow:intselectedGendor inComponent:0];
       // [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewCivilstatus];
    }
    else if ([sender tag]==8)
    {
        [self pickerView:PickerSchoolstatus didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewSchoolstatus];
    }
    else if ([sender tag]==9)
    {
        [self pickerView:PickerCountry didSelectRow:intselectedGendor inComponent:0];
       // [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewCountrys];
    }
    else if ([sender tag]==10)
    {
        [self pickerView:PickerProvilence didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewProvilence];
    }
    else if ([sender tag]==11)
    {
        [self pickerView:PickerStates didSelectRow:intselectedGendor inComponent:0];
        //[scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewStates];
    }
    else if ([sender tag]==12)
    {
        [self pickerView:PickerReligion didSelectRow:intselectedGendor inComponent:0];
       // [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewReligion];
    }
//    else if ([sender tag]==13)
//    {
//        [self pickerView:pick didSelectRow:intselectedGendor inComponent:0];
//       [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
//        [self showPicker:NO andView:viewReligion];
////        [self SetInrestSelction];
//        
//    }
}
-(void)SetInrestSelction{
    isShow = YES;
    [self IntrsetView];
}
-(void)btnBirthdateClicked:(id)sender
{
    [self hideKeyboard];
   // [scrlContent setContentOffset:CGPointMake(0,selectedBirthdayHeight-150)animated:YES];
    [self showPicker:YES andView:viewBirthday];
}
-(void)IntrsetView
{
    
    backView = [[UIView alloc]initWithFrame:self.view.frame];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.5l;
    backView.hidden = NO;
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    
    intrestView = [[UIView alloc] init];
    intrestView.frame= CGRectMake(10, DEVICE_HEIGHT, DEVICE_WIDTH-20, 288);
    intrestView.backgroundColor = [UIColor whiteColor];
    intrestView.userInteractionEnabled = YES;
    intrestView.autoresizesSubviews = YES;
    [self.view addSubview:intrestView];
    
    if (isShow == YES)
    {
        
        // selected = YES;
        [UIView transitionWithView:intrestView duration:0.4
                           options:UIViewAnimationOptionCurveEaseIn
                        animations:^{
                            if (IS_IPHONE_5)
                            {
                                [intrestView setFrame:CGRectMake(10, DEVICE_HEIGHT-(DEVICE_HEIGHT-68), DEVICE_WIDTH-20, 400)];
                            }else
                            {
                                [intrestView setFrame:CGRectMake(10, DEVICE_HEIGHT-(DEVICE_HEIGHT-68), DEVICE_WIDTH-20, 400)];
                            }
                        }
                        completion:^(BOOL finished) {
                        }];
    }
    else
    {
        
        
        [UIView transitionWithView:intrestView duration:0.4
                           options:UIViewAnimationOptionTransitionNone
                        animations:^{
                            if (IS_IPHONE_5) {
                                [intrestView setFrame:CGRectMake(10, DEVICE_HEIGHT, DEVICE_WIDTH-20, 288)];
                            }else{
                                [intrestView setFrame:CGRectMake(10, DEVICE_HEIGHT, DEVICE_WIDTH-20, 288)];
                            }
                        }
                        completion:^(BOOL finished) {
                        }];
    }
    
    UILabel * backHeaderLbl2 = [[UILabel alloc] init];
    backHeaderLbl2.frame = CGRectMake(0, 0, intrestView.frame.size.width, 50);
    backHeaderLbl2.backgroundColor = violetgreenColor;
    [intrestView addSubview:backHeaderLbl2];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(2, 3, 100, 44);
    [cancelBtn setTitle:[TSLanguageManager localizedString:@"Cancel"] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(clearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [intrestView addSubview:cancelBtn];
    
    UIButton * btnsaveEmail = [UIButton buttonWithType:UIButtonTypeCustom];
    btnsaveEmail.frame = CGRectMake(intrestView.frame.size.width-70, 3, 60, 44);
    [btnsaveEmail setTitle:[TSLanguageManager localizedString:@"Save"] forState:UIControlStateNormal];
    [btnsaveEmail addTarget:self action:@selector(btnsaveEmailClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnsaveEmail setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [intrestView addSubview:btnsaveEmail];
    
    UIColor *color = [UIColor grayColor];
    
    txtAddIntrest =[[UITextField alloc]initWithFrame:CGRectMake(10,100, intrestView.frame.size.width-20, 25)];
    txtAddIntrest.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[TSLanguageManager localizedString:@"Enter Interests"] attributes:@{NSForegroundColorAttributeName: color}];
    txtAddIntrest.textAlignment=NSTextAlignmentLeft;
    txtAddIntrest.delegate=self;
    txtAddIntrest.font = [UIFont systemFontOfSize:15];
    txtAddIntrest.textColor = [UIColor blackColor];
    txtAddIntrest.layer.cornerRadius=1.0;
    txtAddIntrest.autocorrectionType = UITextAutocorrectionTypeYes;
    txtAddIntrest.keyboardType = UIKeyboardTypeEmailAddress;
    txtAddIntrest.returnKeyType = UIReturnKeyDone;
    txtAddIntrest.spellCheckingType = UITextSpellCheckingTypeYes;
    [intrestView addSubview:txtAddIntrest];
    
    //    y= y+100;
    
    UILabel * fourthLine = [[UILabel alloc] init];
    fourthLine.frame= CGRectMake(10, 130, intrestView.frame.size.width-20, 0.5);
    fourthLine.backgroundColor = violetgreenColor;
    [intrestView addSubview:fourthLine];
    //
    UIButton * btnAddEmail = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAddEmail.frame = CGRectMake(intrestView.frame.size.width-45,83, 40, 40) ;
    [btnAddEmail addTarget:self action:@selector(btnIntrestClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnAddEmail setImage:[UIImage imageNamed:@"popup_plus_icon.png"] forState:UIControlStateNormal];
    [intrestView addSubview:btnAddEmail];
    
    tblIntrests =[[UITableView alloc]initWithFrame:CGRectMake(10, 160, intrestView.frame.size.width-20, intrestView.frame.size.height-170)style:UITableViewStylePlain];
    tblIntrests.delegate = self;
    tblIntrests.dataSource = self;
    tblIntrests.userInteractionEnabled = YES;
    tblIntrests.scrollEnabled = YES;
    tblIntrests.layer.masksToBounds=YES;
    [intrestView addSubview:tblIntrests];
    tblIntrests.showsVerticalScrollIndicator = NO;
    tblIntrests.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (arrinvite .count >0) {
        arrInterstSelection = [arrinvite mutableCopy];
        [tblIntrests reloadData];
    }
}
-(void)clearBtnClick:(id)sender
{
    isShow = NO;
    [backView removeFromSuperview];
    [intrestView removeFromSuperview];
    //clearTable = YES;
    //[arrInterstSelection removeAllObjects];
    if (arrinvite .count >0) {
        arrInterstSelection = [arrinvite mutableCopy];
        [tblIntrests reloadData];
    }
    [tblIntrests reloadData];
    
    //    [viewTraparent removeFromSuperview];
    //    [viewBackground removeFromSuperview];
}
-(void)btnIntrestClicked:(id)sender
{
    [self hideKeyboard];
    clearTable = NO;
    
    [tblIntrests reloadData];
    
    //[APP_DELEGATE setUpTabBarController];
    
    if ([txtAddIntrest.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please enter interest" cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else
    {
        //        NSString * fishDetailStr =[NSString stringWithFormat:@"insert into 'WindowType_Table'('window_id','name') values('-1','%@')",txtWindowname.text];
        //        [[DataBaseManager dataBaseManager] execute:fishDetailStr];
        
        NSMutableDictionary * dic1 = [[NSMutableDictionary alloc] init];
        [dic1 setObject:txtAddIntrest.text forKey:@"name"];
        [dic1 setObject:@"0" forKey:@"window_id"];
        [dic1 setObject:@"No" forKey:@"isSelected"];
        [arrInterstSelection addObject:txtAddIntrest.text];
        [tblIntrests reloadData];
        txtAddIntrest.text = @"";
        //        [viewBackground removeFromSuperview];
        //self.navigationItem.hidesBackButton = YES;
    }
}
-(void)btnsaveEmailClicked:(id)sender
{
    if (![txtAddIntrest.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please add interests to list of interests." cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
                
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if([arrInterstSelection count]==0)
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please add interests to list of interests." cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
                
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else
    {
        arrinvite = [[NSMutableArray alloc]init];
        NSString * result;
//        for (int i=0; i<[arrInterstSelection count]; i++)
//        {
////            [arrinvite addObject:[[arrInterstSelection objectAtIndex:i] valueForKey:@"name"]];
//            [arrinvite addObject:[[arrInterstSelection objectAtIndex:i] valueForKey:@"name"]];
//        }
        if (arrInterstSelection.count>0) {
            arrinvite = [arrInterstSelection mutableCopy];
        }
        result = [arrinvite componentsJoinedByString:@","];
        NSLog(@"result==>%@",result);
        lblInterst.text = result;
        lblInterst.textColor = [UIColor blackColor];
        [backView removeFromSuperview];
        [intrestView removeFromSuperview];
        
        //================== Interst ================//
        NSInteger ZZ;
        if (states == YES) {
            ZZ = StartForStateandProvience;
        }
         ZZ = StartForIntrest;
        CGSize IntrestSize = [APP_DELEGATE getSizeForText:lblInterst.text andWidth:scrlContent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:15];
        if (IntrestSize.height<50) {
            IntrestSize.height = 50;
        }
        [imgInterstTextBox setFrame:CGRectMake(20, ZZ, scrlContent.frame.size.width-40, IntrestSize.height)];
        lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, imgInterstTextBox.frame.size.height);
        
        btnIntrest.frame = lblInterst.frame;
        btnIntrest.frame=lblInterst.frame;
        btnIntrest.tag = 12;
        //================== Religion ================//
        
        ZZ = ZZ+imgInterstTextBox.frame.size.height+5;
        imgReligionTextBox.frame = CGRectMake(20,ZZ,scrlContent.frame.size.width-40, 50);
        txtReligion.frame = CGRectMake(10,0, imgReligionTextBox.frame.size.width-20, 50);
        
        btnReligion.frame=txtReligion.frame;
        btnReligion.tag = 11;
        selectedReligionHeight = ZZ;
        //================== SaveButton ================//
        
        ZZ = ZZ+imgReligionTextBox.frame.size.height+8;
        
        btnContinue.frame = CGRectMake(20,ZZ, scrlContent.frame.size.width-40,45);
        [activityIndicatorForSave setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
        //================== StoreButton ================//
        
        ZZ = ZZ+btnContinue.frame.size.height+8;
        btnStoreButton.frame = CGRectMake(20,ZZ, scrlContent.frame.size.width-40,45);
        //================== logoutButton ================//
        
        ZZ = ZZ+btnStoreButton.frame.size.height+8;
        btnlogoutButton.frame = CGRectMake(20,ZZ, scrlContent.frame.size.width-40,45);
        [activityIndicatorForlogout setFrame:CGRectMake(btnlogoutButton.frame.size.width-40, 5, 30, 30)];
        //==============================================//
        ZZ = ZZ+btnlogoutButton.frame.size.height+8;
        [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, ZZ+5)];

    }
}
-(void)btnChangeLanguageClikced:(id)sender
{
//    
//    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Settings ==> General ==> Language & Region ==> Select iPhone Language" cancelButtonTitle:ALERT_CANCEL otherButtonTitles:OK_BTN , nil];
//    [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//        [alertView hideWithCompletionBlock:^{
//            if (buttonIndex == 1) {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-Prefs:root=General&path=INTERNATIONAL"]];//ajay
//            }
//            
//        }];
//    }];
//    [alertView showWithAnimation:URBAlertAnimationTopToBottom];
    //changeLanguage = YES;
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General"]];
//
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
//    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Work in progress.." cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//    [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//        [alertView hideWithCompletionBlock:^{
//            
//        }];
//    }];
//    [alertView showWithAnimation:URBAlertAnimationTopToBottom];
}

#pragma mark - Animations
-(void)showPicker:(BOOL)isShow andView:(UIView *)myView
{
    if (isShow == YES)
    {
        [UIView transitionWithView:myView duration:0.4
                           options:UIViewAnimationOptionCurveEaseIn
                        animations:^{
                            if (IS_IPHONE_5) {
                                [myView setFrame:CGRectMake(0, 568-250, 320, 250)];
                            }
                            else if (IS_IPHONE_6)
                            {
                                [myView setFrame:CGRectMake(0, DEVICE_HEIGHT-250, DEVICE_WIDTH, 250)];
                                
                            }
                            else if (IS_IPHONE_6plus)
                            {
                                [myView setFrame:CGRectMake(0, DEVICE_HEIGHT-250, DEVICE_WIDTH, 250)];
                                
                            }
                            else
                            {
                                [myView setFrame:CGRectMake(0, 480-250, 320, 250)];
                            }
                        }
                        completion:^(BOOL finished) {
                            int selectedIndex=0;

                            if (myView == viewGendor) {
                                for (int i=0; i<[arrSex count]; i++)
                                {
                                    if ([txtSex.text isEqualToString:[[arrSex objectAtIndex:i]valueForKey:@"English_name"]] || [txtSex.text isEqualToString:[[arrSex objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerGendor selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerGendor didSelectRow:selectedIndex inComponent:0];
                            }
                            else if (myView == viewGendorOrentation){
                                for (int i=0; i<[arrGendorOreintation count]; i++)
                                {
                                    if ([txtSexOrientation.text isEqualToString:[[arrGendorOreintation objectAtIndex:i]valueForKey:@"English_name"]] || [txtSexOrientation.text isEqualToString:[[arrGendorOreintation objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerGendorOrientation selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerGendorOrientation didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewBody){
                                for (int i=0; i<[arrBody count]; i++)
                                {
                                    if ([txtBody.text isEqualToString:[[arrBody objectAtIndex:i]valueForKey:@"English_name"]] || [txtBody.text isEqualToString:[[arrBody objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerBody selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerBody didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewEyes){
                                for (int i=0; i<[arrEyes count]; i++)
                                {
                                    if ([txtEyes.text isEqualToString:[[arrEyes objectAtIndex:i]valueForKey:@"English_name"]] || [txtEyes.text isEqualToString:[[arrEyes objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerEye selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerEye didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewSkin){
                                for (int i=0; i<[arrSkin count]; i++)
                                {
                                    if ([txtSkin.text isEqualToString:[[arrSkin objectAtIndex:i]valueForKey:@"English_name"]] || [txtSkin.text isEqualToString:[[arrSkin objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerSkin selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerSkin didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewHair){
                                for (int i=0; i<[arrHair count]; i++)
                                {
                                    if ([txtHair.text isEqualToString:[[arrHair objectAtIndex:i]valueForKey:@"English_name"]] || [txtHair.text isEqualToString:[[arrHair objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerHair selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerHair didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewCivilstatus){
                                for (int i=0; i<[arrCivilStatus count]; i++)
                                {
                                    if ([txtCivilStatus.text isEqualToString:[[arrCivilStatus objectAtIndex:i]valueForKey:@"English_name"]] || [txtCivilStatus.text isEqualToString:[[arrCivilStatus objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerCivilStatus selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerCivilStatus didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewSchoolstatus){
                                for (int i=0; i<[arrSchool count]; i++)
                                {
                                    if ([txtSchool.text isEqualToString:[[arrSchool objectAtIndex:i]valueForKey:@"English_name"]] || [txtSchool.text isEqualToString:[[arrSchool objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerSchoolstatus selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerSchoolstatus didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewCountrys){
                                for (int i=0; i<[arrCountry count]; i++)
                                {
                                    if ([txtCountry.text isEqualToString:[[arrCountry objectAtIndex:i]valueForKey:@"English_name"]] || [txtCountry.text isEqualToString:[[arrCountry objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerCountry selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerCountry didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewProvilence){
                                for (int i=0; i<[arrProvience count]; i++)
                                {
                                    if ([txtState.text isEqualToString:[[arrProvience objectAtIndex:i]valueForKey:@"English_name"]] || [txtState.text isEqualToString:[[arrProvience objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerProvilence
                                 selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerProvilence didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewStates){
                                for (int i=0; i<[arrStates count]; i++)
                                {
                                    if ([txtState.text isEqualToString:[[arrStates objectAtIndex:i]valueForKey:@"English_name"]] || [txtState.text isEqualToString:[[arrStates objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerStates
                                 selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerStates didSelectRow:selectedIndex inComponent:0];
                            }else if (myView == viewReligion){
                                for (int i=0; i<[arrReligion count]; i++)
                                {
                                    if ([txtReligion.text isEqualToString:[[arrReligion objectAtIndex:i]valueForKey:@"English_name"]] || [txtReligion.text isEqualToString:[[arrReligion objectAtIndex:i]valueForKey:@"Spanish_name"]])
                                    {
                                        selectedIndex=i;
                                    }
                                }
                                [PickerReligion
                                 selectRow:selectedIndex inComponent:0 animated:YES];
                                [self pickerView:PickerReligion didSelectRow:selectedIndex inComponent:0];
                            }
                        }];
    }
    else
    {
        [UIView transitionWithView:myView duration:0.4
                           options:UIViewAnimationOptionTransitionNone
                        animations:^{
                            if (IS_IPHONE_5)
                            {
                                [myView setFrame:CGRectMake(0, 568, 320, 250)];
                            }
                            else if (IS_IPHONE_6)
                            {
                                [myView setFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
                                
                            }
                            else if (IS_IPHONE_6plus)
                            {
                                [myView setFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
                                
                            }
                            else{
                                [myView setFrame:CGRectMake(0, 480, 320, 250)];
                            }
                        }
                        completion:^(BOOL finished) {
                        }];
    }
}
#pragma mark TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [self hidePickerViews];
    
    if (IS_IPHONE_4)
    {
        //[scrlContent setContentOffset:CGPointMake(0, textField.frame.origin.y-50) animated:YES];
    }
    
    if(textField==txtCivilProvision)
    {
        [scrlContent setContentOffset:CGPointMake(0,selectedProvisionHeight)animated:YES];
    }
    if(textField==txtCity)
    {
        [scrlContent setContentOffset:CGPointMake(0,selectedCityHeight)animated:YES];
    }
    //[self showPicker:NO andView:viewBirthday];
    
//    if(textField==txtCityname)
//    {
//        if(IS_IPHONE_5)
//        {
//            [scrlContent setContentOffset:CGPointMake(0,txtSex.frame.size.height)animated:YES];
//        }
//        else if (IS_IPHONE_6)
//        {
//            [scrlContent setContentOffset:CGPointMake(0,50)animated:YES];
//        }
//        textField.inputAccessoryView = nil;
//    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField == txtfname)
    {
        [txtfname resignFirstResponder];
    }
    else if (textField == txtCivilProvision)
    {
        [txtCivilProvision resignFirstResponder];

    }
    
    [scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];
    
    return YES;
}
#pragma mark - hidePickerViews
-(void)hidePickerViews
{
    [scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];
    //[self showPicker:NO andView:viewBirthday];
    [self showPicker:NO andView:viewGendor];
    [self showPicker:NO andView:viewGendorOrentation];
    [self showPicker:NO andView:viewBirthday];
    [self showPicker:NO andView:viewBody];
    [self showPicker:NO andView:viewEyes];
    [self showPicker:NO andView:viewSkin];
    [self showPicker:NO andView:viewHair];
    [self showPicker:NO andView:viewCivilstatus];
    [self showPicker:NO andView:viewSchoolstatus];
    [self showPicker:NO andView:viewCountrys];
    [self showPicker:NO andView:viewProvilence];
    [self showPicker:NO andView:viewStates];
    [self showPicker:NO andView:viewReligion];

}
#pragma mark - PickerView Delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==PickerGendor)
    {
    return [arrSex count];

    }
    else if (pickerView == PickerGendorOrientation){
        return [arrGendorOreintation count];
    }
    else if (pickerView == PickerBody){
        return [arrBody count];
    }
    else if (pickerView == PickerEye){
        return [arrEyes count];
    }
    else if (pickerView == PickerHair){
        return [arrHair count];
    }
    else if (pickerView == PickerSkin){
        return [arrSkin count];
    }
    else if (pickerView == PickerCivilStatus){
        return [arrCivilStatus count];
    }
    else if (pickerView == PickerSchoolstatus){
        return [arrSchool count];
    }
    else if (pickerView == PickerCountry){
        return [arrCountry count];
    }
    else if (pickerView == PickerProvilence){
        return [arrProvience count];
    }
    else if (pickerView == PickerStates){
        return [arrStates count];
    }
    else if (pickerView == PickerReligion){
        return [arrReligion count];
    }
//    else if (pickerView == PickerStates){
//        return [arrStates count];
//    }
    
        return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = (UILabel*) view;
    if (label == nil)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
    }
    
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    label.tag = row;
    
    if (pickerView==PickerGendor)
    {
        [label setFrame:CGRectMake(0, 0, PickerGendor.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrSex objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrSex objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerGendorOrientation)
    {
        [label setFrame:CGRectMake(0, 0, PickerGendorOrientation.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrGendorOreintation objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrGendorOreintation objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }

        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
        
    }
    else if (pickerView==PickerBody)
    {
        [label setFrame:CGRectMake(0, 0, PickerBody.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrBody objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrBody objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerEye)
    {
        [label setFrame:CGRectMake(0, 0, PickerEye.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrEyes objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrEyes objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerHair)
    {
        [label setFrame:CGRectMake(0, 0, PickerHair.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrHair objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrHair objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerSkin)
    {
        [label setFrame:CGRectMake(0, 0, PickerSkin.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrSkin objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrSkin objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerCivilStatus)
    {
        [label setFrame:CGRectMake(0, 0, PickerCivilStatus.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrCivilStatus objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrCivilStatus objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerSchoolstatus)
    {
        [label setFrame:CGRectMake(0, 0, PickerSchoolstatus.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrSchool objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrSchool objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerCountry)
    {
        [label setFrame:CGRectMake(0, 0, PickerCountry.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrCountry objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrCountry objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerProvilence)
    {
        [label setFrame:CGRectMake(0, 0, PickerProvilence.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrProvience objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrProvience objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerStates)
    {
        [label setFrame:CGRectMake(0, 0, PickerStates.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrStates objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrStates objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;
        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }
    else if (pickerView==PickerReligion)
    {
        [label setFrame:CGRectMake(0, 0, PickerReligion.frame.size.width, 50)];
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            label.text = [NSString stringWithFormat:@"%@",[[arrReligion objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrReligion objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            label.textColor = violetgreenColor;

        }
        else
        {
            label.textColor = [UIColor darkGrayColor];
        }
    }

    return label;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *strSelctd;
    
    if (pickerView == PickerGendor) {
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
        strSelctd = [[arrSex objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrSex objectAtIndex:row]valueForKey:@"Spanish_name"];
          }
        strSexkeyWord = [[arrSex objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strSexkeyWord==>%@",strSexkeyWord);
        intselectedGendor=row;
        [txtSex setText:strSelctd];
        [PickerGendor reloadAllComponents];
    }
    else if (pickerView == PickerGendorOrientation){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrGendorOreintation objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrGendorOreintation objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strSexOrinetationkeyWord = [[arrGendorOreintation objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strSexOrinetationkeyWord==>%@",strSexOrinetationkeyWord);

        intselectedGendor=row;
        [txtSexOrientation setText:strSelctd];
        [PickerGendorOrientation reloadAllComponents];
    }
    else if (pickerView == PickerBody){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrBody objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrBody objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strBodykeyWord = [[arrBody objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strBodykeyWord==>%@",strBodykeyWord);
        
        intselectedGendor=row;
        [txtBody setText:strSelctd];
        [PickerBody reloadAllComponents];
    }
    else if (pickerView == PickerEye){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrEyes objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrEyes objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strEyekeyWord = [[arrEyes objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strEyekeyWord==>%@",strBodykeyWord);
        
        intselectedGendor=row;
        [txtEyes setText:strSelctd];
        [PickerEye reloadAllComponents];
    }
    else if (pickerView == PickerHair){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrHair objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrHair objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strHairkeyWord = [[arrHair objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strHairkeyWord==>%@",strHairkeyWord);
        
        intselectedGendor=row;
        [txtHair setText:strSelctd];
        [PickerHair reloadAllComponents];
    }
    else if (pickerView == PickerSkin){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrSkin objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrSkin objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strSkinkeyWord = [[arrSkin objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strSkinkeyWord==>%@",strSkinkeyWord);
        
        intselectedGendor=row;
        [txtSkin setText:strSelctd];
        [PickerSkin reloadAllComponents];
    }
    else if (pickerView == PickerCivilStatus){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrCivilStatus objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrCivilStatus objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strCivilstatusKeyWord = [[arrCivilStatus objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strCivilstatusKeyWord==>%@",strCivilstatusKeyWord);
        
        intselectedGendor=row;
        [txtCivilStatus setText:strSelctd];
        [PickerCivilStatus reloadAllComponents];
    }
    else if (pickerView == PickerSchoolstatus){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrSchool objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrSchool objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strSchoolKeyWord = [[arrSchool objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strSchoolKeyWord==>%@",strSchoolKeyWord);
        
        intselectedGendor=row;
        [txtSchool setText:strSelctd];
        [PickerSchoolstatus reloadAllComponents];
    }
    else if (pickerView == PickerCountry){

        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrCountry objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrCountry objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strCountryKeyWord = [[arrCountry objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strCountryKeyWord==>%@",strCountryKeyWord);
        
        intselectedGendor=row;
        [txtCountry setText:strSelctd];
        [PickerCountry reloadAllComponents];
        
        NSString *   labelText = @"";
        if ([strCountryKeyWord isEqualToString:@"CU"] || [strCountryKeyWord isEqualToString:@"US"]) {
            if ([strCountryKeyWord isEqualToString:@"CU"]) {
                txtState.text = @"";
                labelText = [TSLanguageManager localizedString:@"Province"];
                
            }else{
                txtState.text = @"";
                labelText = [TSLanguageManager localizedString:@"State"];
            }
            
            states = YES;

            NSInteger zz = StartForStateandProvience;
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
            NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc] init];
            
            attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
            paragraphStyle =[[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:0.1];
            [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
            [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, labelText.length)];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
            
            imgStateTextBox.frame = CGRectMake(20,zz,scrlContent.frame.size.width-40, 50);
            imgStateTextBox.hidden = NO;
            [imgStateTextBox setImage:[UIImage imageNamed:@"txtbox_icon.png"]];
            imgStateTextBox.userInteractionEnabled = YES;
            [scrlContent addSubview:imgStateTextBox];
            
            txtState.frame = CGRectMake(10,0, imgStateTextBox.frame.size.width-20, 50);
            txtState.delegate=self;
            txtState.textColor = [UIColor blackColor];
            txtState.backgroundColor = [UIColor clearColor];
            txtState.layer.cornerRadius=1.0;
            txtState.font=[UIFont systemFontOfSize:15];
            txtState.autocorrectionType = UITextAutocorrectionTypeNo;
            [txtState setAttributedPlaceholder:attributedString];
            [imgStateTextBox addSubview:txtState];

            imageStateDropdown.frame  = CGRectMake(txtCountry.frame.size.width-20,(txtCountry.frame.size.height/2)-(12/2), 15, 12);
            imageStateDropdown.image = [UIImage imageNamed:@"downward facing arrow"];
            [txtState addSubview:imageStateDropdown];
            
            btnProvience.backgroundColor=[UIColor clearColor];
            [btnProvience addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
            btnProvience.frame=txtState.frame;
            if ([strSelctd isEqualToString:@"Cuba"]) {
                btnProvience.tag = 9;
            }else{
                btnProvience.tag = 10;
            }
            [imgStateTextBox addSubview:btnProvience];
            selectedPrivienceHeight = zz;

            //================== Interst ================//
            zz = zz+imgStateTextBox.frame.size.height+5;
//            imgInterstTextBox.frame = CGRectMake(20,zz,scrlContent.frame.size.width-40, 50);
//            lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, 50);
            CGSize IntrestSize = [APP_DELEGATE getSizeForText:lblInterst.text andWidth:scrlContent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:15];
            if (IntrestSize.height<50) {
                IntrestSize.height = 50;
            }
            [imgInterstTextBox setFrame:CGRectMake(20, zz, scrlContent.frame.size.width-40, IntrestSize.height)];
            lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, imgInterstTextBox.frame.size.height);
            btnIntrest.frame = lblInterst.frame;
            //================== Religion ================//
            
            zz = zz+imgInterstTextBox.frame.size.height+5;
            imgReligionTextBox.frame = CGRectMake(20,zz,scrlContent.frame.size.width-40, 50);
            txtReligion.frame = CGRectMake(10,0, imgReligionTextBox.frame.size.width-20, 50);
            btnReligion.frame=txtReligion.frame;
            btnReligion.tag = 11;
            selectedReligionHeight = zz;
            //================== SaveButton ================//
            
            zz = zz+imgReligionTextBox.frame.size.height+8;
            btnContinue.frame = CGRectMake(20,zz, scrlContent.frame.size.width-40,45);
            [activityIndicatorForSave setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
            //================== StoreButton ================//
            
            zz = zz+btnContinue.frame.size.height+8;
            btnStoreButton.frame = CGRectMake(20,zz, scrlContent.frame.size.width-40,45);
            //================== logoutButton ================//
            
            zz = zz+btnStoreButton.frame.size.height+8;
            btnlogoutButton.frame = CGRectMake(20,zz, scrlContent.frame.size.width-40,45);
            [activityIndicatorForlogout setFrame:CGRectMake(btnlogoutButton.frame.size.width-40, 5, 30, 30)];
            //==============================================//
            zz = zz+btnlogoutButton.frame.size.height+8;
            [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, zz+5)];
            
        }
        else{
            states = NO;

            imgStateTextBox.hidden = YES;
            //================== Interst ================//
            NSInteger RR = StartForStateandProvience;
            
            CGSize IntrestSize = [APP_DELEGATE getSizeForText:lblInterst.text andWidth:scrlContent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:15];
            if (IntrestSize.height<50) {
                IntrestSize.height = 50;
            }
            [imgInterstTextBox setFrame:CGRectMake(20, RR, scrlContent.frame.size.width-40, IntrestSize.height)];
            lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, imgInterstTextBox.frame.size.height);
//            
//            imgInterstTextBox.frame = CGRectMake(20,RR,scrlContent.frame.size.width-40, 50);
//            lblInterst.frame = CGRectMake(10,0,imgInterstTextBox.frame.size.width-20, 50);
            btnIntrest.frame = lblInterst.frame;
            //================== Religion ================//
            
            RR = RR+imgInterstTextBox.frame.size.height+5;
            imgReligionTextBox.frame = CGRectMake(20,RR,scrlContent.frame.size.width-40, 50);
            txtReligion.frame = CGRectMake(10,0, imgReligionTextBox.frame.size.width-20, 50);
            
            btnReligion.frame=txtReligion.frame;
            btnReligion.tag = 11;
            selectedReligionHeight = RR;
            //================== SaveButton ================//
            
            RR = RR+imgReligionTextBox.frame.size.height+8;
            
            btnContinue.frame = CGRectMake(20,RR, scrlContent.frame.size.width-40,45);
            [activityIndicatorForSave setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
            //================== StoreButton ================//
            
            RR = RR+btnContinue.frame.size.height+8;
            btnStoreButton.frame = CGRectMake(20,RR, scrlContent.frame.size.width-40,45);
            //================== logoutButton ================//
            
            RR = RR+btnStoreButton.frame.size.height+8;
            btnlogoutButton.frame = CGRectMake(20,RR, scrlContent.frame.size.width-40,45);
            [activityIndicatorForlogout setFrame:CGRectMake(btnlogoutButton.frame.size.width-40, 5, 30, 30)];
            //==============================================//
            RR = RR+btnlogoutButton.frame.size.height+8;
            [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, RR+5)];
        }
    }
    else if (pickerView == PickerProvilence){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrProvience objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrProvience objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strProvienceKeyWord = [[arrProvience objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strSchoolKeyWord==>%@",strProvienceKeyWord);
        
        intselectedGendor=row;
        [txtState setText:strSelctd];
        [PickerProvilence reloadAllComponents];
    }
    else if (pickerView == PickerStates){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrStates objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrStates objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strStateKeyWord = [[arrStates objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strStateKeyWord==>%@",strStateKeyWord);
        
        intselectedGendor=row;
        [txtState setText:strSelctd];
        [PickerStates reloadAllComponents];
    }
    else if (pickerView == PickerReligion){
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrReligion objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrReligion objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strRelogionKeyWord = [[arrReligion objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strRelogionKeyWord==>%@",strRelogionKeyWord);
        
        intselectedGendor=row;
        [txtReligion setText:strSelctd];
        [PickerReligion reloadAllComponents];
    }

}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *viewForSection = [[UIView alloc] init];
    viewForSection.frame = CGRectMake(0, 0,tblIntrests.frame.size.width, 40);
    viewForSection.backgroundColor = violetgreenColor;;
    
    UILabel * lblHeader = [[UILabel alloc]initWithFrame:CGRectMake(8,0,200, 40)];
    lblHeader.textColor = [UIColor whiteColor];
    lblHeader.text = [TSLanguageManager localizedString:@"List of interests"];
    [lblHeader setFont:[UIFont systemFontOfSize:15]];
    [viewForSection addSubview:lblHeader];
    
    return viewForSection;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([arrInterstSelection count]>0)
    {
        return 50;
    }
    else
    {
        return 30;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (clearTable)
    {
        return 0;
    }
    else
    {
        if ([arrInterstSelection count]>0)
        {
            return [arrInterstSelection count];;
        }
        else
        {
            return 1;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellID";
    
    IntrestCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[IntrestCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //cell.backgroundColor = [UIColor blueColor];
    //    cell.lblBedroom.text = @"prabhu";
    //    cell.lblBedroom.textColor = [UIColor redColor];
    if ([arrInterstSelection count]==0)
    {
        cell.btnDeleteIntrset.hidden = YES;
        cell.lblSeperator.hidden = YES;
        cell.lblintrstsadd.frame=CGRectMake(0,0,cell.frame.size.width, 70);
        cell.lblintrstsadd.font = [UIFont systemFontOfSize:15 ];;
        [cell.lblintrstsadd setTextAlignment:NSTextAlignmentCenter];
        cell.lblintrstsadd.text=@"No interests added.";
        cell.lblintrstsadd.textColor = [UIColor grayColor];
        cell.lblintrstsadd.numberOfLines=0;
        cell.lblintrstsadd.userInteractionEnabled = YES;
        
        [tableView setScrollEnabled:NO];
    }
    else
    {
        [tableView setScrollEnabled:YES];

        cell.lblintrstsadd.hidden = NO;
        cell.lblSeperator.hidden = YES;
        cell.btnDeleteIntrset.hidden = NO;
        cell.lblintrstsadd.frame = CGRectMake(8,(50/2)-(25/2), cell.contentView.frame.size.width-16, 25);
        cell.lblintrstsadd.font = [UIFont systemFontOfSize:14];
        cell.lblintrstsadd.textColor = [UIColor blackColor];
        cell.lblintrstsadd.textAlignment = NSTextAlignmentLeft;
        cell.lblintrstsadd.text = @"";
        cell.lblintrstsadd.hidden = NO;
        cell.lblintrstsadd.tag = indexPath.row;
        [cell.btnDeleteIntrset addTarget:self action:@selector(btnDeleteEmailClicked:) forControlEvents:UIControlEventTouchUpInside];
        cell.btnDeleteIntrset.frame = CGRectMake(intrestView.frame.size.width-50,(50/2)-(40/2) , 30, 40) ;
        [cell.btnDeleteIntrset setImage:[UIImage imageNamed:@"cancel_People.png"] forState:UIControlStateNormal];
//        if ([[arrInterstSelection objectAtIndex:indexPath.row]>0)
//        {
////            cell.lblintrstsadd.text = [[arrInterstSelection objectAtIndex:indexPath.row] valueForKey:@"name"];
//            
//            cell.lblintrstsadd.text = [arrInterstSelection objectAtIndex:indexPath.row];
//        }
//        else
//        {
//            cell.lblintrstsadd.text = @"";
//        }
        cell.lblintrstsadd.text = [arrInterstSelection objectAtIndex:indexPath.row];
        cell.btnDeleteIntrset.tag = indexPath.row;

        cell.lblSeperator.frame = CGRectMake(0, 49.5, tblIntrests.frame.size.width, 0.5);
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        [arrInterstSelection removeObjectAtIndex:indexPath.row];
//        [tableView reloadData];
//    }
//}

#pragma mark-buttonActions
-(void)btnDeleteEmailClicked:(id)sender
{
    if (arrInterstSelection>0) {
        [arrInterstSelection removeObjectAtIndex:[sender tag]];
    }
    [tblIntrests reloadData];
}
#pragma mark - Action Clicked
-(void)EditPhotoClick
{
    [self hideKeyboard];
    UIActionSheet *imagePickerType= [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:ALERT_CANCEL destructiveButtonTitle:nil otherButtonTitles: ACTION_TAKE_PHOTO , nil];
    [imagePickerType  showInView:self.view];
}
#pragma mark - UIActionsheet Delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:ALERT_CANCEL])
        return;
    
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:ACTION_TAKE_PHOTO])
    {
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else
        {
            imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }
    else if([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:ACTION_LIBRARY_PHOTO])
    {
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void) actionSheetCancel:(UIActionSheet *)actionSheet
{
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    if(image != nil)
    {
        imgProfile.image= image;
        [imgProfile setContentMode:UIViewContentModeScaleAspectFill];
        
        [self callWebapiforUpdateImage];
    }
    isFromimagePicker = YES;
        //ImageSelected = YES;
    [picker dismissModalViewControllerAnimated:YES];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //ImageSelected = NO;
}

#pragma mark - WebserviceCalling
-(void)upDatewebserviceCalling
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        
//        [btnContinue setEnabled:NO];
        [placeActivityIndicator startAnimating];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:@"piropazo profile" forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
//        [parameter_dict setObject:@"3805a2cfd481280abaee16a08363f175" forKey:@"token"];

        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"GettUserDetails";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
        
        NSLog(@"parameter_dict==>%@",parameter_dict);
    }
}
-(void)callWebapiforUpdateProfile
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [btnContinue setEnabled:NO];
        [activityIndicatorForSave startAnimating];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_Filed = [[NSMutableDictionary alloc]init];
        
        if (strSexkeyWord == nil) {
            
            strSexkeyWord = @"";
        }
        else{
        }
        
        if (strSexOrinetationkeyWord == nil) {
            strSexOrinetationkeyWord = @"";
        }
        else{
        }
        
        if (strBodykeyWord == nil) {
            strBodykeyWord = @"";
        }
        else{
        }
        
        if (strEyekeyWord == nil) {
            strEyekeyWord = @"";
        }
        else{
        }
        
        if (strHairkeyWord == nil) {
            strHairkeyWord = @"";
        }
        else{
        }
        
        if (strSkinkeyWord == nil) {
            strSkinkeyWord = @"";
        }
        else{
        }
        
        if (strCivilstatusKeyWord == nil) {
            strCivilstatusKeyWord = @"";
        }
        else{
        }
        
        if (strSchoolKeyWord == nil) {
            strSchoolKeyWord = @"";
        }
        else{
        }
        
        if (strCountryKeyWord == nil) {
            strCountryKeyWord = @"";
        }
        else{
        }
        
        if (strProvienceKeyWord == nil) {
            strProvienceKeyWord = @"";
        }
        else{
        }
        
        if (strStateKeyWord == nil) {
            strStateKeyWord = @"";
        }
        else{
        }
        
        if (strRelogionKeyWord == nil) {
            strRelogionKeyWord = @"";
        }
        else{
        }
        
        
        
    //============================//
        if ([strSexkeyWord isEqualToString:@""]) {
            
            strSexkeyWord = @"";
        }
        else{
            
            [parameter_Filed setObject:strSexkeyWord forKey:@"SEXO"];
        }
        
        if ([strSexOrinetationkeyWord isEqualToString:@""]) {
            strSexOrinetationkeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strSexOrinetationkeyWord forKey:@"ORIENTACION"];

        }
        
        if ([strBodykeyWord isEqualToString:@""]) {
            strBodykeyWord = @"";
        }
        else{
            
            [parameter_Filed setObject:strBodykeyWord forKey:@"CUERPO"];
        }
        
        if ([strEyekeyWord isEqualToString:@""]) {
            strEyekeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strEyekeyWord forKey:@"OJOS"];
        }
        
        if ([strHairkeyWord isEqualToString:@""]) {
            strHairkeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strHairkeyWord forKey:@"PELO"];
         }
        
        if ([strSkinkeyWord isEqualToString:@""]) {
            strSkinkeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strSkinkeyWord forKey:@"PIEL"];
        }
        
        if ([strCivilstatusKeyWord isEqualToString:@""]) {
            strCivilstatusKeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strCivilstatusKeyWord forKey:@"ESTADO"];
        }
        
        if ([strSchoolKeyWord isEqualToString:@""]) {
            strSchoolKeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strSchoolKeyWord forKey:@"NIVEL"];
        }
        
        if ([strCountryKeyWord isEqualToString:@""]) {
            strCountryKeyWord = @"";
        }
        else{
            [parameter_Filed setObject:strCountryKeyWord forKey:@"PAIS"];
        }
        
        if ([strProvienceKeyWord isEqualToString:@""]) {
            strProvienceKeyWord = @"";
        }
        else{
        }
        
        if (strStateKeyWord == nil) {
            strStateKeyWord = @"";
        }
        else{
        }
        
        if ([strRelogionKeyWord isEqualToString:@""]) {
            strRelogionKeyWord = @"";
        }
        else{
            
            [parameter_Filed setObject:strRelogionKeyWord forKey:@"RELIGION"];
        }
        
        
        if([strCountryKeyWord isEqualToString:@"CU"]){
            [parameter_Filed setObject:strProvienceKeyWord forKey:@"PROVINCIA"];
        }
        
        if ([strCountryKeyWord isEqualToString:@"US"]) {
            [parameter_Filed setObject:strStateKeyWord forKey:@"USSTATE"];
        }
        
        if (txtfname.text.length>0) {
            [parameter_Filed setObject:txtfname.text forKey:@"NOMBRE"];
        }
        
        if(txtCivilProvision.text.length>0){
            [parameter_Filed setObject:txtCivilProvision.text forKey:@"PROFESION"];
        }
        if (lblInterst.text.length>0) {
            [parameter_Filed setObject:lblInterst.text forKey:@"INTERESES"];

        }
        
        if (txtCity.text.length>0) {
            [parameter_Filed setObject:txtCity.text forKey:@"CIUDAD"];
        }
        
        [parameter_Filed setObject:txtBirthDay.text forKey:@"CUMPLEANOS"];
        
        NSString * strLang = [NSString stringWithFormat:@"%@",[TSLanguageManager selectedLanguage]];
        [parameter_Filed setObject:strLang forKey:@"LANG"];
        
        NSString * registerStr = [parameter_Filed JSONRepresentation];
        
        NSString * strBulk = [NSString stringWithFormat:@"perfil bulk %@",registerStr];
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strBulk forKey:@"subject"];
        
        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
        {
            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        }
        else
        {
            [parameter_dict setObject:@"" forKey:@"token"];
        }
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"UpdateProfile";
        [manager postUrlCallForReg:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
        
        NSLog(@"parameter_dict==>%@",parameter_dict);
    }
}

-(void)callWebapiforUpdateImage
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [btnContinue setEnabled:NO];
        [activityIndicatorForSave startAnimating];
        
//        if (ImageSelected==NO)
//        {
//            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please tap your avatar to take a picture before continuing"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//                [alertView hideWithCompletionBlock:^{
//                    
//                }];
//            }];
//            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
//        }
//        else
//        {
            NSString * webServiceName = @"run/api";
            
            //NSData* data ;
            
//            data = UIImageJPEGRepresentation(imgProfile.image, 0.2f);
//             NSString *strEncoded = [base encode:data];
        
        
        NSString *base64String = [UIImageJPEGRepresentation(imgProfile.image, 0.2f)
                                  base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
            NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
            [parameter_dict setObject:@"perfil FOTO" forKey:@"subject"];
            [parameter_dict setObject:base64String forKey:@"attachment"];
            
            if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null]) {
                [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
                
            }
            else{
                [parameter_dict setObject:@"" forKey:@"token"];
            }
            
            URLManager *manager = [[URLManager alloc] init];
            manager.delegate = self;
            manager.commandName = @"ImageUploading";
            [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
       // }
    }
}
-(void)callWebApiForCrownSetting
{
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    [parameter_dict setObject:@"piropazo corona" forKey:@"subject"];
    
    if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null]) {
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
    }
    else{
        [parameter_dict setObject:@"" forKey:@"token"];
    }
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"CrownSetting";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
 
}
-(void)unreadcount
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:@"piropazo unread" forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"unreadMessages";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
//-(void)CallWebapiForLogout {
//    
//    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Your account is in use in another device. Please logout first."] cancelButtonTitle:OK_BTN otherButtonTitles:nil, nil];
//    [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
//    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//        [alertView hideWithCompletionBlock:^{
//            if (buttonIndex == 0) {
//                BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
//                if (isNetAvaliable == NO)
//                {
//                }else{
//                    
//                    NSString * webServiceName = @"api/logout";
//                    
//                    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
//                    if (CURRENT_USER_ACCESS_TOKEN) {
//                        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
//                        {
//                            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
//                        }
//                        else
//                        {
//                            [parameter_dict setObject:@"" forKey:@"token"];
//                        }
//                    }
//                                        
//                    URLManager *manager = [[URLManager alloc] init];
//                    manager.delegate = self;
//                    manager.commandName = @"Logout";
//                    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
//                }
//            }
//        }];
//    }];
//    [alertView showWithAnimation:Alert_Animation_Type];
//    
//}
#pragma mark Response
- (void)onResult:(NSDictionary *)result {
    
    [btnContinue setEnabled:YES];
    [btnlogoutButton setEnabled:YES];
    [activityIndicatorForSave stopAnimating];
    [placeActivityIndicator stopAnimating];
    [activityIndicatorForlogout stopAnimating];
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"GettUserDetails"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
//            strProvienceKeyWord = @"";
//            strStateKeyWord = @"";
//            strCountryKeyWord = @"";
            
            if([[result valueForKey:@"result"] valueForKey:@"profile"])
            {
                if ([[result valueForKey:@"result"] valueForKey:@"profile"]!=nil && [[result valueForKey:@"result"] valueForKey:@"profile"]!=[NSNull null])
                {
                    
                    NSMutableDictionary * dicDetails = [[NSMutableDictionary alloc]init];
                    dicDetails = [result valueForKey:@"result"];;
                    
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    
                    NSString * strGenderSave = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]];
                    
                    NSString * strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]]];
                    
                    if (strGenderSave!=nil && ![strGenderSave isEqualToString:@"(null)"] ) {
                        [userDefaults setObject:strGenderSave forKey:@"GENDER_STATUS"];
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
                    
                    
                    NSString * strUserName = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"username"]]];
                    
                    
                    if (strUserName!=nil && ![strUserName isEqualToString:@"(null)"] ) {
                        [userDefaults setObject:strUserName forKey:@"CURRENT_USER_FIRST_NAME"];
                    }
                    else{
                        [userDefaults setObject:@"" forKey:@"CURRENT_USER_FIRST_NAME"];
                    }
                                        
                    [userDefaults synchronize];
 
                    [self dataPassingtoFields:dicDetails];
                    NSString * strGender = [[[result valueForKey:@"result"] valueForKey:@"profile"]valueForKey:@"gender"];
                    
                    if (![strGender isEqualToString:@""] && strGender !=nil && ![strGender isEqualToString:@"(null)"]  )
                    {
                        if ([strGender isEqualToString:@"F"])
                        {
                            UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                            item.image = [UIImage imageNamed:@"female.png"];
                            item.selectedImage = [[UIImage imageNamed:@"active_female.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                        }
                        else
                        {
                            UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                            item.image = [UIImage imageNamed:@"user.png"];
                            item.selectedImage = [[UIImage imageNamed:@"active_user.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                        }
                    }
                }
            }
        }else if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"error"]){
            
            //[self CallWebapiForLogout];
            [APP_DELEGATE CallWebapiForLogout];
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"unreadMessages"])
    {
        NSLog(@"Inside==>");
        [arrUnreadTotalCount removeAllObjects];
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([[[result valueForKey:@"result"] valueForKey:@"items"]count]>0) {
                if ([[result valueForKey:@"result"] valueForKey:@"items"]!=nil && [[result valueForKey:@"result"] valueForKey:@"items"]!=[NSNull null]) {
                    arrUnreadTotalCount = [[result valueForKey:@"result"] valueForKey:@"items"];
                    
                    if ([arrUnreadTotalCount count]>0) {
                        NSLog(@"arrUnreadTotalCount%@",arrUnreadTotalCount);
                        imgUnreadMessageCount.hidden = NO;
                        lblUnreadCount.hidden = NO;
                        
                        lblUnreadCount.text = [NSString stringWithFormat:@"%lu",[arrUnreadTotalCount count]];
                    }
                    else{
                        imgUnreadMessageCount.hidden = YES;
                        lblUnreadCount.hidden = YES;
                        
                    }
                }
            }
            else{
                imgUnreadMessageCount.hidden = YES;
                lblUnreadCount.hidden = YES;
            }
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"UpdateProfile"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            
            [self upDatewebserviceCalling];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Refresh" object:nil];

            if (strSexkeyWord!=nil) {
                if ([strSexkeyWord isEqualToString:@"MASCULINO"]) {
                    UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                    item.image = [UIImage imageNamed:@"user.png"];
                    item.selectedImage = [[UIImage imageNamed:@"active_user.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }else{
                    UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                    item.image = [UIImage imageNamed:@"female.png"];
                    item.selectedImage = [[UIImage imageNamed:@"active_female.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
            }
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"ImageUploading"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {

        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"CrownSetting"])
    {
        [self upDatewebserviceCalling];
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"Logout"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSLog(@"logout==>");
            deviceTokenStr = @"";
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_ACCESS_TOKEN"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_EMAIL"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"NEW_USER_STATUS"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"GENDER_STATUS"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USER_IMAGE"];

            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_FIRST_NAME"];

            
            [[NSUserDefaults standardUserDefaults] synchronize];
            

            ValidateEmailVC * splash = [[ValidateEmailVC alloc] init];
            UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
            navControl.navigationBarHidden=YES;
            appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            appDelegate.window.rootViewController = navControl;
        }
    }
}
#pragma mark - helperMethods
-(NSString *)todatetimonly:(NSString *)givenDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:givenDate];
    // converting into our required date format
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *reqDateString = [dateFormatter stringFromDate:date];
    //NSLog(@"date is %@", reqDateString);
    
    return reqDateString;
}
- (void)onError:(NSError *)error{
    [btnContinue setEnabled:YES];
    [activityIndicatorForSave stopAnimating];
    [placeActivityIndicator stopAnimating];
    [btnlogoutButton setEnabled:YES];
    [activityIndicatorForlogout stopAnimating];
    [self upDatewebserviceCalling];

    NSLog(@"The error is...%@", error);
}

@end
