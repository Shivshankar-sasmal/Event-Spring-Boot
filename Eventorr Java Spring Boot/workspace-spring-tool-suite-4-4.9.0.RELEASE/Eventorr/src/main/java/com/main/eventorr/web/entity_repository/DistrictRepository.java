// Datebase Model Repository Package
package com.main.eventorr.web.entity_repository;

import java.util.HashSet;

// Main Repository Import
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

// District Database Model
import com.main.eventorr.web.entity.District;




public interface DistrictRepository extends JpaRepository<District, Long> {
	@Query("SELECT district FROM District district WHERE district.district LIKE %?1% ORDER BY district.district ASC")	
	HashSet<District> findBySearchAdminDistrict(String search_district);
	
	District findById(long district_id);
	
	District findByDistrict(String district);
}
