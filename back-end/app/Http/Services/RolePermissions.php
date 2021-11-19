<?php
/**
 * Created by PhpStorm.
 * User: Adrian
 * Date: 31/03/2018
 * Time: 3:17 PM
 */

namespace App\Http\Services;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class RolePermissions
{
    //    ROLE ID WITH PERMISSION
    //    1 - SUPER ADMIN
    //    2 - ADMINISTRATOR
    //    3 - SITE MANAGER
    //    4 - GUEST
    public function getUserRole(){
        return Auth::user()->role_id;
    }
    //SUPER ADMIN ONLY
    public function superAdminRestriction(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT MODELS PERMISSION
    public function dietOptionRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function dietOptionAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function dietOptionUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function dietOptionDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT MODELS PERMISSION
    public function boatModelRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatModelAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatModelUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatModelDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT TYPES PERMISSION
    public function boatTypeRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatTypeAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatTypeUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatTypeDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT BRANDS PERMISSION
    public function boatBrandRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatBrandAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatBrandUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatBrandDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }


    //CABIN TYPES PERMISSION
    public function cabinTypeRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function cabinTypeAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function cabinTypeUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function cabinTypeDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }


    //INCLUSIONS PERMISSION
    public function inclusionRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function inclusionAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function inclusionUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function inclusionDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }


    //EXCLUSIONS PERMISSION
    public function exclusionRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function exclusionAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function exclusionUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function exclusionDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //ITINERARY BRAND PERMISSION
    public function itineraryBrandRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER, RoleTypes::GUEST);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryBrandAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryBrandUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryBrandDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //ITINERARY COUNTRY PERMISSION
    public function itineraryCountryRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCountryAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCountryUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCountryDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //ADD ON PERMISSION
    public function addOnRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function addOnAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function addOnUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function addOnDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT PERMISSION
    public function boatRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //ITINERARY CITY PERMISSION
    public function itineraryCityRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCityAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCityUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryCityDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //ITINERARY PERMISSION
    public function itineraryRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function itineraryDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT CREWS PERMISSION
    public function boatCrewRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatCrewAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatCrewUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatCrewDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }

    //BOAT AMBASSADORS PERMISSION
    public function boatAmbassadorRead(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatAmbassadorAdd(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatAmbassadorUpdate(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
    public function boatAmbassadorDelete(){
        $is_authorized=array(RoleTypes::SUPER_ADMIN,RoleTypes::ADMINISTRATOR,RoleTypes::SITE_MANAGER);
        if (in_array($this->getUserRole(), $is_authorized))
            return true;
    }
}
