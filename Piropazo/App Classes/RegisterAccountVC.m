//
//  RegisterAccountVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "RegisterAccountVC.h"
#import "TSLanguageManager.h"
#import "AppDelegate.h"
//#import "ACFloatingTextField.h"


@interface RegisterAccountVC ()

@end

@implementation RegisterAccountVC

#pragma mark - Life Cycle
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    changeLanguage = NO;

    ImageSelected = NO;
    //========================= SexArray =======================//
    arrGendor = [[NSMutableArray alloc]init];
    NSMutableDictionary * dicMale = [[NSMutableDictionary alloc]init];
    [dicMale setObject:@"Male" forKey:@"English_name"];
    [dicMale setObject:@"Masculino" forKey:@"Spanish_name"];
    [dicMale setObject:@"MASCULINO" forKey:@"KeyWord"];
    
    NSMutableDictionary * dicFemale = [[NSMutableDictionary alloc]init];
    [dicFemale setObject:@"Female" forKey:@"English_name"];
    [dicFemale setObject:@"Femenino" forKey:@"Spanish_name"];
    [dicFemale setObject:@"FEMENINO" forKey:@"KeyWord"];
    
    [arrGendor addObject:dicMale];
    [arrGendor addObject:dicFemale];
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
    arrProvilence = [[NSMutableArray alloc]init];
    
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
    
    [arrProvilence addObject:dicPinar];
    [arrProvilence addObject:dicHabana];
    [arrProvilence addObject:dicArtemisa];
    [arrProvilence addObject:dicMayabeque];
    [arrProvilence addObject:dicMatanzas];
    [arrProvilence addObject:dicVillas];
    [arrProvilence addObject:dicCienfuegos];
    [arrProvilence addObject:dicSpiritus];
    [arrProvilence addObject:dicCiego];
    [arrProvilence addObject:dicCamag];
    [arrProvilence addObject:dicLas];
    [arrProvilence addObject:dicHolg];
    [arrProvilence addObject:dicGranma];
    [arrProvilence addObject:dicSantiago];
    [arrProvilence addObject:dicGuan];
    [arrProvilence addObject:dicIsla];
    
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
    //[arrStates addObject:dicCienfuegos];//ajay
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

    

    [self setFrame];
    
    [self SetNavigationbar];

    
    [APP_DELEGATE endHudProcess];

    
    [self setDetailPickerViews];

    // Do any additional setup after loading the view.
}
#pragma mark - Content Frame
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
#pragma mark - Frame Settings
-(void)setFrame
{
    
    UIImageView * imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    imgBack.userInteractionEnabled = YES;
    
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
//    scrlContent = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, imgBack.frame.size.width-40,imgBack.frame.size.height-30)];
    scrlContent = [[UIScrollView alloc]init];
    
    if (IS_IPHONE_5 || IS_IPHONE_4)
    {
        scrlContent.frame = CGRectMake(20, 20, imgBack.frame.size.width-40, imgBack.frame.size.height-30);
    }
    else{
        scrlContent.frame = CGRectMake(20, 20, imgBack.frame.size.width-40, imgBack.frame.size.height-60);
    }
    
    scrlContent.backgroundColor = [UIColor clearColor];
    [imgBack addSubview:scrlContent];
    
    
    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(0, 0,scrlContent.frame.size.width,scrlContent.frame.size.height)];
    viewTransperent.backgroundColor = [UIColor whiteColor];
    viewTransperent.alpha = 0.9;
    viewTransperent.userInteractionEnabled  = YES;
    viewTransperent.layer.cornerRadius = 5;
    viewTransperent.clipsToBounds = YES;
    viewTransperent.layer.shadowColor = [UIColor grayColor].CGColor;
    viewTransperent.layer.shadowOffset = CGSizeMake(3, 3);
    viewTransperent.layer.shadowOpacity = 5.0;
    viewTransperent.layer.shadowRadius = 5.0;
    [scrlContent addSubview:viewTransperent];
    
    
//    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scrlContent.frame.size.width,scrlContent.frame.size.height)];
//    viewTransperent.backgroundColor = [UIColor whiteColor];
//    viewTransperent.alpha = 0.9;
//    viewTransperent.userInteractionEnabled  = YES;
//    viewTransperent.layer.cornerRadius = 3;
//    [scrlContent addSubview:viewTransperent];
//    
    int yy = 20;
    
    imgProfile  = [[UIImageView alloc] init];
    imgProfile.frame = CGRectMake((viewTransperent.frame.size.width/2)-(102/2),yy, 102,102);
//    imgProfile.backgroundColor = darkGayColor;
    imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2;
    imgProfile.layer.masksToBounds = YES;
    imgProfile.image = [UIImage imageNamed:@"register_user.png"];
    [imgProfile setContentMode:UIViewContentModeScaleAspectFill];
    imgProfile.layer.shadowColor = [UIColor grayColor].CGColor;
//    imgProfile.layer.shadowOffset = CGSizeMake(3, 3);
//    imgProfile.layer.shadowOpacity = 0.8;
//    imgProfile.layer.shadowRadius = 5.0;
    imgProfile.clipsToBounds = YES;
    //imgProfile.layer.masksToBounds = NO;
    imgProfile.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgProfile.layer.shadowRadius = 6.0;
    imgProfile.layer.shadowOpacity = 0.4;
    [viewTransperent addSubview:imgProfile];
    
    UIButton *btnTakePhoto=[UIButton buttonWithType:UIButtonTypeCustom];
    btnTakePhoto.frame=CGRectMake(imgProfile.frame.origin.x, imgProfile.frame.origin.y, imgProfile.frame.size.width, imgProfile.frame.size.height);
    [btnTakePhoto addTarget:self action:@selector(EditPhotoClick) forControlEvents:UIControlEventTouchUpInside];
    [viewTransperent addSubview:btnTakePhoto];
    
    yy = yy + 102+10;
    
    NSString *   labelText = [TSLanguageManager localizedString:@"UserName"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    
    NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, labelText.length)];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    

    txtFirstname=[[UITextField alloc]initWithFrame:CGRectMake(20, yy, viewTransperent.frame.size.width-40, 48)];
    txtFirstname.textAlignment = NSTextAlignmentLeft;
    txtFirstname.autocorrectionType = UITextAutocorrectionTypeNo;
    txtFirstname.keyboardType = UIKeyboardTypeDefault;
    [txtFirstname setDelegate:self];
    txtFirstname.backgroundColor = [UIColor clearColor];
    [txtFirstname setAttributedPlaceholder:attributedString];
    txtFirstname.returnKeyType = UIReturnKeyNext;
//    CALayer *bottomBorder = [CALayer layer];
//    bottomBorder.frame = CGRectMake(0.0f, txtFirstname.frame.size.height - 1, txtFirstname.frame.size.width, 1.0f);
//    bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
//    [txtFirstname.layer addSublayer:bottomBorder];
    [APP_DELEGATE addRegisterTextFieldBottomColorr:txtFirstname];

    [viewTransperent addSubview:txtFirstname];
    
    
    
    yy=yy+55;
    
    labelText = [TSLanguageManager localizedString:@"UserSex"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtSex=[[UITextField alloc]initWithFrame:CGRectMake(19, yy, viewTransperent.frame.size.width-40, 48)];
    txtSex.textAlignment = NSTextAlignmentLeft;
    txtSex.autocorrectionType = UITextAutocorrectionTypeNo;
    txtSex.keyboardType = UIKeyboardTypeDefault;
    [txtSex setDelegate:self];
    txtSex.backgroundColor = [UIColor clearColor];
    [txtSex setAttributedPlaceholder:attributedString];
    txtSex.returnKeyType = UIReturnKeyNext;
    [viewTransperent addSubview:txtSex];
    [APP_DELEGATE addRegisterTextFieldBottomColorr:txtSex];

    UIButton *btnSex=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSex.backgroundColor=[UIColor clearColor];
    [btnSex addTarget:self action:@selector(btnSexClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSex.frame=txtSex.frame;
    [viewTransperent addSubview:btnSex];
    
    imgSexDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtSex.frame.size.width-20, (txtSex.frame.size.height/2)-(12/2), 15, 12)];
    imgSexDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSex addSubview:imgSexDownArrow];
    
    yy=yy+55;
    
    labelText = [TSLanguageManager localizedString:@"UserSexOrientation"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtSexorientation=[[UITextField alloc]initWithFrame:CGRectMake(19, yy, viewTransperent.frame.size.width-40, 48)];
    txtSexorientation.textAlignment = NSTextAlignmentLeft;
    txtSexorientation.autocorrectionType = UITextAutocorrectionTypeNo;
    txtSexorientation.keyboardType = UIKeyboardTypeDefault;
    [txtSexorientation setDelegate:self];
    txtSexorientation.backgroundColor = [UIColor clearColor];
    [txtSexorientation setAttributedPlaceholder:attributedString];
    txtSexorientation.returnKeyType = UIReturnKeyNext;
    [APP_DELEGATE addRegisterTextFieldBottomColorr:txtSexorientation];
    [viewTransperent addSubview:txtSexorientation];
    
    imgSexorientationDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtSexorientation.frame.size.width-20, (txtSexorientation.frame.size.height/2)-(12/2), 15, 12)];
    imgSexorientationDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtSexorientation addSubview:imgSexorientationDownArrow];

    
    UIButton *btnSexOrient=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSexOrient.backgroundColor=[UIColor clearColor];
    [btnSexOrient addTarget:self action:@selector(btnSexorientaionClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSexOrient.frame=txtSexorientation.frame;
    [viewTransperent addSubview:btnSexOrient];

    selectedSexualOrientationHeight = yy;

    yy=yy+55;
    
    labelText = [TSLanguageManager localizedString:@"UserBirthday"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtBirthday=[[UITextField alloc]initWithFrame:CGRectMake(19, yy, viewTransperent.frame.size.width-40, 48)];
    txtBirthday.textAlignment = NSTextAlignmentLeft;
    txtBirthday.autocorrectionType = UITextAutocorrectionTypeNo;
    txtBirthday.keyboardType = UIKeyboardTypeDefault;
    [txtBirthday setDelegate:self];
    txtBirthday.backgroundColor = [UIColor clearColor];
    [txtBirthday setAttributedPlaceholder:attributedString];
    txtBirthday.returnKeyType = UIReturnKeyNext;
    [APP_DELEGATE addRegisterTextFieldBottomColorr:txtBirthday];
    [viewTransperent addSubview:txtBirthday];
    
    imgBirthDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtBirthday.frame.size.width-20, (txtBirthday.frame.size.height/2)-(12/2), 15, 12)];
    imgBirthDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtBirthday addSubview:imgBirthDownArrow];
    
    
    UIButton *btnDate=[UIButton buttonWithType:UIButtonTypeCustom];
    btnDate.backgroundColor=[UIColor clearColor];
    [btnDate addTarget:self action:@selector(btnBirthdateClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnDate.frame=txtBirthday.frame;
    [viewTransperent addSubview:btnDate];
    
    selectedBirthdayHeight = yy;

         yy=yy+55;

    p = yy;
    
    labelText = [TSLanguageManager localizedString:@"Country"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtCityname=[[UITextField alloc]initWithFrame:CGRectMake(20, yy, viewTransperent.frame.size.width-40, 48)];
    txtCityname.textAlignment = NSTextAlignmentLeft;
    txtCityname.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCityname.keyboardType = UIKeyboardTypeDefault;
    [txtCityname setDelegate:self];
    txtCityname.backgroundColor = [UIColor clearColor];
    [txtCityname setAttributedPlaceholder:attributedString];
    txtCityname.returnKeyType = UIReturnKeyNext;
   // [APP_DELEGATE addRegisterTextFieldBottomColorr:txtCityname];
    [viewTransperent addSubview:txtCityname];
    
    
    imgCityDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtCityname.frame.size.width-20, (txtCityname.frame.size.height/2)-(12/2), 15, 12)];
    imgCityDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtCityname addSubview:imgCityDownArrow];
    
    
    firstLine = [[UILabel alloc] init];
    firstLine.frame= CGRectMake(20, yy+47, txtCityname.frame.size.width-10, 1);
    firstLine.backgroundColor = [UIColor blackColor];
    [viewTransperent addSubview:firstLine];
    
    btnCityname=[UIButton buttonWithType:UIButtonTypeCustom];
    btnCityname.backgroundColor=[UIColor clearColor];
    [btnCityname addTarget:self action:@selector(btnCitynameClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCityname.frame=txtCityname.frame;
    [viewTransperent addSubview:btnCityname];

    
    labelText = [TSLanguageManager localizedString:@"Province"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtProvince=[[UITextField alloc]initWithFrame:CGRectMake(20, yy, viewTransperent.frame.size.width-40, 48)];
    txtProvince.textAlignment = NSTextAlignmentLeft;
    txtProvince.autocorrectionType = UITextAutocorrectionTypeNo;
    txtProvince.keyboardType = UIKeyboardTypeDefault;
    [txtProvince setDelegate:self];
    txtProvince.backgroundColor = [UIColor clearColor];
    [txtProvince setAttributedPlaceholder:attributedString];
    txtProvince.returnKeyType = UIReturnKeyDone;
    txtProvince.hidden = YES;
    //[APP_DELEGATE addRegisterTextFieldBottomColorr:txtProvince];
    [viewTransperent addSubview:txtProvince];
    
    imgProvinceDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtProvince.frame.size.width-20, (txtProvince.frame.size.height/2)-(12/2), 15, 12)];
    imgProvinceDownArrow.hidden = YES;
    imgProvinceDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtProvince addSubview:imgProvinceDownArrow];
    
    btnProvince=[UIButton buttonWithType:UIButtonTypeCustom];
    btnProvince.backgroundColor=[UIColor clearColor];
    [btnProvince addTarget:self action:@selector(btnProvinceClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnProvince.frame=txtProvince.frame;
    btnProvince.hidden = YES;
    [viewTransperent addSubview:btnProvince];
    
    labelText = [TSLanguageManager localizedString:@"State"];
    attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    paragraphStyle =[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.1];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:Custom_Regular size:15.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:172.0/255.0 green:172.0/255.0 blue:172.0/255.0 alpha:1.0] range:NSMakeRange(0, labelText.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    txtStates=[[UITextField alloc]initWithFrame:CGRectMake(20, yy, viewTransperent.frame.size.width-40, 48)];
    txtStates.textAlignment = NSTextAlignmentLeft;
    txtStates.autocorrectionType = UITextAutocorrectionTypeNo;
    txtStates.keyboardType = UIKeyboardTypeDefault;
    [txtStates setDelegate:self];
    txtStates.backgroundColor = [UIColor clearColor];
    [txtStates setAttributedPlaceholder:attributedString];
    txtStates.returnKeyType = UIReturnKeyDone;
    txtStates.hidden = YES;
    //[APP_DELEGATE addRegisterTextFieldBottomColorr:txtProvince];
    [viewTransperent addSubview:txtStates];
    
   /* imgStatesDownArrow  = [[UIImageView alloc]initWithFrame:CGRectMake(txtStates.frame.size.width-20, (txtStates.frame.size.height/2)-(12/2), 15, 12)];
    imgStatesDownArrow.hidden = YES;
    imgStatesDownArrow.image = [UIImage imageNamed:@"downward facing arrow"];
    [txtStates addSubview:imgStatesDownArrow];*/

    btnStatesp=[UIButton buttonWithType:UIButtonTypeCustom];
    btnStatesp.backgroundColor=[UIColor clearColor];
    [btnStatesp addTarget:self action:@selector(btnStatesClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnStatesp.frame=txtStates.frame;
    btnStatesp.hidden = YES;
    [viewTransperent addSubview:btnStatesp];
    
    SecondLine = [[UILabel alloc] init];
    SecondLine.hidden = YES;
    SecondLine.frame= CGRectMake(20, yy+47, txtStates.frame.size.width, 1);
    SecondLine.backgroundColor = [UIColor blackColor];
    [viewTransperent addSubview:SecondLine];
    
    selectedCountryHeight = yy;
    yy=yy+60;

    btnContinue= [UIButton buttonWithType:UIButtonTypeCustom];
    if (IS_IPHONE_4 || IS_IPHONE_5)
    {
        
        btnContinue.frame = CGRectMake(30,yy,viewTransperent.frame.size.width-60,45);

    }
    else
    {
        btnContinue.frame = CGRectMake(30,yy+50,viewTransperent.frame.size.width-60,45);

    }
    [btnContinue setTitle:[TSLanguageManager localizedString:@"ContinueText"] forState:UIControlStateNormal];
    [btnContinue setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];
    btnContinue.layer.cornerRadius = 5.0;
    [btnContinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnContinue.clipsToBounds = YES;
    [btnContinue addTarget:self action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTransperent addSubview:btnContinue];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
    [btnContinue addSubview:activityIndicator];
    
    [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, yy+50)];
    scrlContent.showsHorizontalScrollIndicator=NO;
    scrlContent.showsVerticalScrollIndicator=NO;
    scrlContent.scrollEnabled=YES;
}

-(void)setDetailPickerViews
{
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
    NSString *dateStr = [dateFormatter stringFromDate:maxDate];

    datePicker.minimumDate = minDate;
    datePicker.maximumDate = maxDate;
    
    selectedDate=dateStr;
    NSLog(@"selectedDate====>%@",selectedDate);
    [datePicker setDate:[dateFormatter dateFromString:selectedDate]];
    [viewBirthday addSubview:datePicker];

    viewGendor = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewGendor setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewGendor];
    
    UIButton * btnDone3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone3 setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDone3 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDone3 setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDone3 setTag:1];
    [btnDone3 addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewGendor addSubview:btnDone3];
    
    PickerGendor = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerGendor setBackgroundColor:[UIColor whiteColor]];
    PickerGendor.delegate=self;
    PickerGendor.dataSource=self;
    [viewGendor addSubview:PickerGendor];
    
    viewGendorOrentation = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewGendorOrentation setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewGendorOrentation];
    
    UIButton * btnDoneOrentation = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDoneOrentation setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnDoneOrentation setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnDoneOrentation setTitle:@"Done" forState:UIControlStateNormal];
    [btnDoneOrentation setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnDoneOrentation setTag:2];
    [btnDoneOrentation addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewGendorOrentation addSubview:btnDoneOrentation];
    
    PickerGendorOrientation = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerGendorOrientation setBackgroundColor:[UIColor whiteColor]];
    PickerGendorOrientation.delegate=self;
    PickerGendorOrientation.dataSource=self;
    [viewGendorOrentation addSubview:PickerGendorOrientation];
    
    viewCountry = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewCountry setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewCountry];
    
    UIButton * btnCountry = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCountry setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnCountry setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnCountry setTitle:@"Done" forState:UIControlStateNormal];
    [btnCountry setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnCountry setTag:3];
    [btnCountry addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewCountry addSubview:btnCountry];
    
    PickerCountry = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerCountry setBackgroundColor:[UIColor whiteColor]];
    PickerCountry.delegate=self;
    PickerCountry.dataSource=self;
    [viewCountry addSubview:PickerCountry];
    
    viewProvilence = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewProvilence setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewProvilence];
    
    UIButton * btnProvilence = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnProvilence setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnProvilence setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnProvilence setTitle:@"Done" forState:UIControlStateNormal];
    [btnProvilence setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnProvilence setTag:4];
    [btnProvilence addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewProvilence addSubview:btnProvilence];
    
    PickerProvilence = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerProvilence setBackgroundColor:[UIColor whiteColor]];
    PickerProvilence.delegate=self;
    PickerProvilence.dataSource=self;
    [viewProvilence addSubview:PickerProvilence];
    
    
    viewStates = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 250)];
    [viewStates setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewStates];
    
   UIButton * btnStates = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnStates setFrame:CGRectMake(0 , 0, DEVICE_WIDTH, 34)];
    [btnStates setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [btnStates setTitle:@"Done" forState:UIControlStateNormal];
    [btnStates setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnStates setTag:5];
    [btnStates addTarget:self action:@selector(GendarDoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [viewStates addSubview:btnStates];
    
    PickerStates = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 34, DEVICE_WIDTH, 216)];
    [PickerStates setBackgroundColor:[UIColor whiteColor]];
    PickerStates.delegate=self;
    PickerStates.dataSource=self;
    [viewStates addSubview:PickerStates];

}

-(void)btnSexClicked:(id)sender
{
    [self hideKeyboard];
 
        [self showPicker:YES andView:viewGendor];
        [scrlContent setContentOffset:CGPointMake(0, txtSex.frame.size.height) animated:YES];
}
-(void)btnSexorientaionClicked:(id)sender
{
    [self hideKeyboard];

    [self showPicker:YES andView:viewGendorOrentation];
    [scrlContent setContentOffset:CGPointMake(0,selectedSexualOrientationHeight-150) animated:YES];
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
-(void)GendarDoneclick:(id)sender
{
    if ([sender tag]==1)
    {
        [self pickerView:PickerGendor didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewGendor];
    }
    else if ([sender tag]==2)
    {
        [self pickerView:PickerGendorOrientation didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewGendorOrentation];
    }
    else if ([sender tag]==3)
    {
        [self pickerView:PickerCountry didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewCountry];
    }
    else if ([sender tag]==4)
    {
        [self pickerView:PickerProvilence didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewProvilence];
    }
    else if ([sender tag]==5)
    {
        [self pickerView:PickerStates didSelectRow:intselectedGendor inComponent:0];
        [scrlContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [self showPicker:NO andView:viewStates];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

#pragma mark - PickerView Delegate
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==PickerGendor)
    {
        return [arrGendor count];
    }
    else if (pickerView == PickerGendorOrientation){
        return [arrGendorOreintation count];
    }
    else if (pickerView == PickerCountry){
        return [arrCountry count];
    }
    else if (pickerView == PickerProvilence){
        return [arrProvilence count];
    }
    else if (pickerView == PickerStates){
        return [arrStates count];
    }
    else
    {
        return 0;
    }
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
            label.text = [NSString stringWithFormat:@"%@",[[arrGendor objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrGendor objectAtIndex:row]valueForKey:@"Spanish_name"]];
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
            label.text = [NSString stringWithFormat:@"%@",[[arrProvilence objectAtIndex:row]valueForKey:@"English_name"]];
        }
        else{
            label.text = [NSString stringWithFormat:@"%@",[[arrProvilence objectAtIndex:row]valueForKey:@"Spanish_name"]];
        }
        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            //label.textColor = [UIColor colorWithRed:1.0/225.0 green:175.0/225.0 blue:174.0/225.0 alpha:1.0];
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
        }        label.textAlignment = NSTextAlignmentCenter;
        if (row == intselectedGendor)
        {
            //label.textColor = [UIColor colorWithRed:1.0/225.0 green:175.0/225.0 blue:174.0/225.0 alpha:1.0];
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
            strSelctd = [[arrGendor objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrGendor objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strSexkeyWord = [[arrGendor objectAtIndex:row]valueForKey:@"KeyWord"];
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
        [txtSexorientation setText:strSelctd];
        [PickerGendorOrientation reloadAllComponents];
    }
    else if (pickerView == PickerCountry)
    {
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrCountry objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrCountry objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strCountrykeyWord = [[arrCountry objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strCountrykeyWord==>%@",strCountrykeyWord);
        intselectedGendor=row;
        [txtCityname setText:strSelctd];
        [PickerCountry reloadAllComponents];

        if ([strCountrykeyWord isEqualToString:@"CU"])
        {
            txtProvince.hidden = NO;
            txtStates.hidden = YES;
            SecondLine.hidden = NO;
            imgCityDownArrow.hidden = NO;
            imgProvinceDownArrow.hidden = NO;
            
            NSInteger  Width = (viewTransperent.frame.size.width)/2;
            txtCityname.frame = CGRectMake(20, p, Width-5, txtCityname.frame.size.height);
            firstLine.hidden = NO;
            firstLine.frame = CGRectMake(20, firstLine.frame.origin.y,Width-30, firstLine.frame.size.height);;
            
            txtProvince.frame = CGRectMake(Width+5, p, Width-30, txtCityname.frame.size.height);
            SecondLine.frame = CGRectMake(Width+4, SecondLine.frame.origin.y, Width-30, SecondLine.frame.size.height);;
            
            imgCityDownArrow.frame = CGRectMake(txtCityname.frame.size.width-40, (txtCityname.frame.size.height/2)-(12/2), 15, 12);
            imgProvinceDownArrow.frame = CGRectMake(txtProvince.frame.size.width-20, (txtProvince.frame.size.height/2)-(12/2), 15, 12);

            btnProvince.hidden = NO;
            btnStatesp.hidden = YES;
            btnProvince.frame = txtProvince.frame;
        }
        else if ([strCountrykeyWord isEqualToString:@"US"])
        {
            txtProvince.hidden = YES;
            txtStates.hidden = NO;
            SecondLine.hidden = NO;
            imgCityDownArrow.hidden = NO;

            NSInteger  Width = (viewTransperent.frame.size.width)/2;
            txtCityname.frame = CGRectMake(20, p, Width-5, txtStates.frame.size.height);
            firstLine.hidden = NO;
            firstLine.frame = CGRectMake(20, firstLine.frame.origin.y,Width-30, firstLine.frame.size.height);;
            
            txtStates.frame = CGRectMake(Width+5, p, Width-30, txtStates.frame.size.height);
            SecondLine.frame = CGRectMake(Width+4, SecondLine.frame.origin.y, Width-20, SecondLine.frame.size.height);;
            
            imgCityDownArrow.frame = CGRectMake(txtCityname.frame.size.width-40, (txtCityname.frame.size.height/2)-(12/2), 15, 12);
//            imgProvinceDownArrow.frame = CGRectMake(txtStates.frame.size.width-20, (txtStates.frame.size.height/2)-(12/2), 15, 12);
            
            btnProvince.hidden = YES;
            btnStatesp.hidden = NO;
            btnStatesp.frame = txtStates.frame;
        }
        else
        {
            txtProvince.hidden = YES;
            txtStates.hidden = YES;
            SecondLine.hidden = YES;
            firstLine.hidden = NO;
            btnProvince.hidden = YES;
            btnStatesp.hidden = YES;
            imgStatesDownArrow.hidden = YES;
            txtCityname.frame = CGRectMake(20, p,viewTransperent.frame.size.width-40, 48);;
            firstLine.frame= CGRectMake(20, p+47, txtCityname.frame.size.width, 1);

            imgCityDownArrow.frame = CGRectMake(txtCityname.frame.size.width-20, (txtCityname.frame.size.height/2)-(12/2), 15, 12);

            intselectedGendor=row;
            [txtCityname setText:strSelctd];
            [PickerCountry reloadAllComponents];
        }
    }
    else if (pickerView == PickerProvilence)
    {
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrProvilence objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrProvilence objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strProvincekeyWord = [[arrProvilence objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strProvincekeyWord==>%@",strProvincekeyWord);
        intselectedGendor=row;
        [txtProvince setText:strSelctd];
        [PickerProvilence reloadAllComponents];
    }
    else if (pickerView == PickerStates)
    {
        if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strSelctd = [[arrStates objectAtIndex:row]valueForKey:@"English_name"];
        }else {
            strSelctd = [[arrStates objectAtIndex:row]valueForKey:@"Spanish_name"];
        }
        strStatekeyWord = [[arrStates objectAtIndex:row]valueForKey:@"KeyWord"];
        NSLog(@"strStatekeyWord==>%@",strStatekeyWord);
        intselectedGendor=row;
        [txtStates setText:strSelctd];
        [PickerStates reloadAllComponents];
    }
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

#pragma mark hideKeyboard
-(void)hideKeyboard
{
    [txtFirstname resignFirstResponder];
 
    [self showPicker:NO andView:viewBirthday];
    [self showPicker:NO andView:viewGendor];
    [self showPicker:NO andView:viewGendorOrentation];
    [self showPicker:NO andView:viewCountry];
    [self showPicker:NO andView:viewProvilence];
    [self showPicker:NO andView:viewStates];

    [scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];
}
 
#pragma mark - Action Clicked
-(void)btnContinueClicked:(id)sender
{
    [self hideKeyboard];
    if ([txtFirstname.text isEqualToString:@""])
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
    else if ([txtSexorientation.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Sexual Orientation"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtBirthday.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Birthday"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if ([txtCityname.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Country"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
        
    }
    else if ([strCountrykeyWord isEqualToString:@"CU"])
    {
        if ([txtProvince.text isEqualToString:@""]) {
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter Province"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                }];
            }];
            [alertView showWithAnimation:Alert_Animation_Type];
        }
        else{
            [self CallwebServiceforRegistration];
        }
    }
    else if ([strCountrykeyWord isEqualToString:@"US"])
    {
        if ([txtStates.text isEqualToString:@""]) {
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter State"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                }];
            }];
            [alertView showWithAnimation:Alert_Animation_Type];
            
        }
        else{
            [self CallwebServiceforRegistration];
        }
    }
    else
    {
        //[self CallwebServiceforEmail];
        [self CallwebServiceforRegistration];
    }
}
#pragma mark - Action Clicked
-(void)EditPhotoClick
{
    [self hideKeyboard];
    UIActionSheet *imagePickerType= [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:ALERT_CANCEL destructiveButtonTitle:nil otherButtonTitles: ACTION_TAKE_PHOTO , nil];
    [imagePickerType  showInView:self.view];
}

-(void)btnBirthdateClicked:(id)sender
{
    [self hideKeyboard];
    [scrlContent setContentOffset:CGPointMake(0,selectedBirthdayHeight-150)animated:YES];
    [self showPicker:YES andView:viewBirthday];
}
-(void)btnCitynameClicked:(id)sender
{
    [self hideKeyboard];
    [scrlContent setContentOffset:CGPointMake(0,selectedCountryHeight-120)animated:YES];
    [self showPicker:YES andView:viewCountry];
}


-(void)btnProvinceClicked:(id)sender
{
    [self hideKeyboard];
    [scrlContent setContentOffset:CGPointMake(0,selectedCountryHeight-120)animated:YES];
    [self showPicker:YES andView:viewProvilence];
}
-(void)btnStatesClicked:(id)sender
{
    
    [self hideKeyboard];
    [scrlContent setContentOffset:CGPointMake(0,selectedCountryHeight-100)animated:YES];
    [self showPicker:YES andView:viewStates];

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
        
        [txtBirthday setText:selectedDate];
    }
    
    [self hideKeyboard];
//    [self btnSexClicked:nil];
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
    }
    ImageSelected = YES;
    
    [self CallwebServiceforImageUplaoding];

    [picker dismissModalViewControllerAnimated:YES];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    ImageSelected = NO;

    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark  - Uitextfield Delegates
/*-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [txtFirstname resignFirstResponder];
    [txtCityname resignFirstResponder];
   
    return YES;
}*/
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
    [self showPicker:NO andView:viewBirthday];
    
    if(textField==txtCityname)
    {
        if(IS_IPHONE_5)
        {
            [scrlContent setContentOffset:CGPointMake(0,txtSex.frame.size.height)animated:YES];
        }
        else if (IS_IPHONE_6)
        {
            [scrlContent setContentOffset:CGPointMake(0,50)animated:YES];
        }
        textField.inputAccessoryView = nil;
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField == txtFirstname)
    {
        
        [txtFirstname resignFirstResponder];
        //[txtSex becomeFirstResponder];
        
    }
    
    [scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];

    return YES;
}
#pragma mark - hidePickerViews
-(void)hidePickerViews
{
    [scrlContent setContentOffset:CGPointMake(0, 0)animated:YES];
    [self showPicker:NO andView:viewBirthday];
    [self showPicker:NO andView:viewGendor];
    [self showPicker:NO andView:viewGendorOrentation];
    [self showPicker:NO andView:viewStates];
    [self showPicker:NO andView:viewProvilence];

}
#pragma mark - Web Service Call
-(void)CallwebServiceforRegistration
{
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
    
    if (strCountrykeyWord == nil) {
        strCountrykeyWord = @"";
    }
    else{
        
    }
    
    if (strProvincekeyWord == nil) {
        strProvincekeyWord = @"";
    }
    else{
        
    }
    
    if (strStatekeyWord == nil) {
        strStatekeyWord = @"";
    }
    else{
        
    }
    
    if(ImageSelected == YES)
    {
        
        [btnContinue setEnabled:NO];
        [activityIndicator startAnimating];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_Filed = [[NSMutableDictionary alloc]init];
        
        if([strCountrykeyWord isEqualToString:@"CU"]){
            [parameter_Filed setObject:strProvincekeyWord forKey:@"PROVINCIA"];
        }
        
        if ([strCountrykeyWord isEqualToString:@"US"]) {
            [parameter_Filed setObject:strStatekeyWord forKey:@"USSTATE"];
        }

        [parameter_Filed setObject:strSexkeyWord forKey:@"SEXO"];
        [parameter_Filed setObject:txtFirstname.text forKey:@"NOMBRE"];
        [parameter_Filed setObject:strSexOrinetationkeyWord forKey:@"ORIENTACION"];
        [parameter_Filed setObject:strCountrykeyWord forKey:@"PAIS"];
        [parameter_Filed setObject:txtBirthday.text forKey:@"CUMPLEANOS"];
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
        manager.commandName = @"Registration";
        [manager postUrlCallForReg:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }else
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please tap your avatar to take a picture before continuing"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
                
            }];
        }];
        [alertView showWithAnimation:URBAlertAnimationTopToBottom];
    }

   }

-(void)CallwebServiceforImageUplaoding
{
//    [btnContinue setEnabled:NO];
//    [activityIndicator startAnimating];

//    if(ImageSelected == YES)
//    {
        NSString * webServiceName = @"run/api";
        
//        NSData* data ;
//        
//        data = UIImageJPEGRepresentation(imgProfile.image, 0.2f);
    
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
    //}
//    else
//    {
//        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please tap your avatar to take a picture before continuing"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//            [alertView hideWithCompletionBlock:^{
//                
//            }];
//        }];
//        [alertView showWithAnimation:URBAlertAnimationTopToBottom];
//    }
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    [btnContinue setEnabled:YES];
    [activityIndicator stopAnimating];
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"Registration"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSLog(@"RegistartionScueesFull==>");
            isForRating = @"NO";
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setValue:isForRating  forKey:@"APP_RATING_FOR"];
            [userDefaults synchronize];
            
            [APP_DELEGATE setUpTabBarController:@"YES"];

            
        }
        else{
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"ImageUploading"])
    {
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            
        }
        else
        {
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }
}

- (void)onError:(NSError *)error
{
    [btnContinue setEnabled:YES];
    [activityIndicator stopAnimating];
    NSLog(@"The error is...%@", error);
}

#pragma mark - Web Service Call
/*-(void)CallwebServiceforEmail
{
}*/

#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
