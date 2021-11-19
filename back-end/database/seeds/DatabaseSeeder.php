<?php

use Illuminate\Database\Seeder;

use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
//        //ADD SYSTEM ROLES
//        $arr = ['Super Admin', 'Administrator', 'Site Manager', 'Guest'];
//        foreach($arr as $row){
//            \App\Role::create([
//                'name' => $row,
//                'created_by' => 1,
//                'updated_by' => 1
//            ]);
//        }
//
//        //ADD SUPER ADMIN USER
        \App\User::create(['last_name' => 'Super Admin','first_name' => 'Super Admin','middle_name' => 'Super Admin','email' => 'a@a2.com','password' => bcrypt('secret'),'role_id' => 1]);
//
//        //ADD GUEST TITLES
//        $arr = ['Mr.', 'Ms.'];
//        foreach($arr as $row){
//            \App\GuestTitle::create([
//                'description' => $row,
//                'created_by' => 1,
//                'updated_by' => 1
//            ]);
//        }
//
//        //ADD PAYMENT TYPES
//        $arr = ['Credit Card', 'Paypal','Bank Transfer'];
//        foreach($arr as $row){
//            \App\PaymentType::create([
//                'description' => $row,
//                'created_by' => 1,
//                'updated_by' => 1
//            ]);
//        }
//
//
//        //ADD NATIONALITIES
//        $arr = ["Afghan","Albanian","Algerian","American","Andorran","Angolan","Antiguans","Argentinean","Armenian","Australian","Austrian","Azerbaijani","Bahamian","Bahraini","Bangladeshi","Barbadian","Barbudans","Batswana","Belarusian","Belgian","Belizean","Beninese","Bhutanese","Bolivian","Bosnian","Brazilian","British","Bruneian","Bulgarian","Burkinabe","Burmese","Burundian","Cambodian","Cameroonian","Canadian","Cape Verdean","Central African","Chadian","Chilean","Chinese","Colombian","Comoran","Congolese","Costa Rican","Croatian","Cuban","Cypriot","Czech","Danish","Djibouti","Dominican","Dutch","East Timorese","Ecuadorean","Egyptian","Emirian","Equatorial Guinean","Eritrean","Estonian","Ethiopian","Fijian","Filipino","Finnish","French","Gabonese","Gambian","Georgian","German","Ghanaian","Greek","Grenadian","Guatemalan","Guinea-Bissauan","Guinean","Guyanese","Haitian","Herzegovinian","Honduran","Hungarian","I-Kiribati","Icelander","Indian","Indonesian","Iranian","Iraqi","Irish","Israeli","Italian","Ivorian","Jamaican","Japanese","Jordanian","Kazakhstani","Kenyan","Kittian and Nevisian","Kuwaiti","Kyrgyz","Laotian","Latvian","Lebanese","Liberian","Libyan","Liechtensteiner","Lithuanian","Luxembourger","Macedonian","Malagasy","Malawian","Malaysian","Maldivian","Malian","Maltese","Marshallese","Mauritanian","Mauritian","Mexican","Micronesian","Moldovan","Monacan","Mongolian","Moroccan","Mosotho","Motswana","Mozambican","Namibian","Nauruan","Nepalese","New Zealander","Ni-Vanuatu","Nicaraguan","Nigerian","Nigerien","North Korean","Northern Irish","Norwegian","Omani","Pakistani","Palauan","Panamanian","Papua New Guinean","Paraguayan","Peruvian","Polish","Portuguese","Qatari","Romanian","Russian","Rwandan","Saint Lucian","Salvadoran","Samoan","San Marinese","Sao Tomean","Saudi","Scottish","Senegalese","Serbian","Seychellois","Sierra Leonean","Singaporean","Slovakian","Slovenian","Solomon Islander","Somali","South African","South Korean","Spanish","Sri Lankan","Sudanese","Surinamer","Swazi","Swedish","Swiss","Syrian","Taiwanese","Tajik","Tanzanian","Thai","Togolese","Tongan","Trinidadian or Tobagonian","Tunisian","Turkish","Tuvaluan","Ugandan","Ukrainian","Uruguayan","Uzbekistani","Venezuelan","Vietnamese","Welsh","Yemenite","Zambian","Zimbabwean"];
//        foreach($arr as $row){
//            \App\Nationality::create([
//                'description' => $row,
//                'created_by' => 1,
//                'updated_by' => 1
//            ]);
//        }


    }
}
