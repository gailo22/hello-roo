// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.domain;

import com.gailo22.domain.FlightDescription;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect FlightDescription_Roo_Finder {
    
    public static Long FlightDescription.countFindFlightDescriptionsByDestinationCityLikeAndOriginCityLike(String destinationCity, String originCity) {
        if (destinationCity == null || destinationCity.length() == 0) throw new IllegalArgumentException("The destinationCity argument is required");
        destinationCity = destinationCity.replace('*', '%');
        if (destinationCity.charAt(0) != '%') {
            destinationCity = "%" + destinationCity;
        }
        if (destinationCity.charAt(destinationCity.length() - 1) != '%') {
            destinationCity = destinationCity + "%";
        }
        if (originCity == null || originCity.length() == 0) throw new IllegalArgumentException("The originCity argument is required");
        originCity = originCity.replace('*', '%');
        if (originCity.charAt(0) != '%') {
            originCity = "%" + originCity;
        }
        if (originCity.charAt(originCity.length() - 1) != '%') {
            originCity = originCity + "%";
        }
        EntityManager em = FlightDescription.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM FlightDescription AS o WHERE LOWER(o.destinationCity) LIKE LOWER(:destinationCity)  AND LOWER(o.originCity) LIKE LOWER(:originCity)", Long.class);
        q.setParameter("destinationCity", destinationCity);
        q.setParameter("originCity", originCity);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<FlightDescription> FlightDescription.findFlightDescriptionsByDestinationCityLikeAndOriginCityLike(String destinationCity, String originCity) {
        if (destinationCity == null || destinationCity.length() == 0) throw new IllegalArgumentException("The destinationCity argument is required");
        destinationCity = destinationCity.replace('*', '%');
        if (destinationCity.charAt(0) != '%') {
            destinationCity = "%" + destinationCity;
        }
        if (destinationCity.charAt(destinationCity.length() - 1) != '%') {
            destinationCity = destinationCity + "%";
        }
        if (originCity == null || originCity.length() == 0) throw new IllegalArgumentException("The originCity argument is required");
        originCity = originCity.replace('*', '%');
        if (originCity.charAt(0) != '%') {
            originCity = "%" + originCity;
        }
        if (originCity.charAt(originCity.length() - 1) != '%') {
            originCity = originCity + "%";
        }
        EntityManager em = FlightDescription.entityManager();
        TypedQuery<FlightDescription> q = em.createQuery("SELECT o FROM FlightDescription AS o WHERE LOWER(o.destinationCity) LIKE LOWER(:destinationCity)  AND LOWER(o.originCity) LIKE LOWER(:originCity)", FlightDescription.class);
        q.setParameter("destinationCity", destinationCity);
        q.setParameter("originCity", originCity);
        return q;
    }
    
    public static TypedQuery<FlightDescription> FlightDescription.findFlightDescriptionsByDestinationCityLikeAndOriginCityLike(String destinationCity, String originCity, String sortFieldName, String sortOrder) {
        if (destinationCity == null || destinationCity.length() == 0) throw new IllegalArgumentException("The destinationCity argument is required");
        destinationCity = destinationCity.replace('*', '%');
        if (destinationCity.charAt(0) != '%') {
            destinationCity = "%" + destinationCity;
        }
        if (destinationCity.charAt(destinationCity.length() - 1) != '%') {
            destinationCity = destinationCity + "%";
        }
        if (originCity == null || originCity.length() == 0) throw new IllegalArgumentException("The originCity argument is required");
        originCity = originCity.replace('*', '%');
        if (originCity.charAt(0) != '%') {
            originCity = "%" + originCity;
        }
        if (originCity.charAt(originCity.length() - 1) != '%') {
            originCity = originCity + "%";
        }
        EntityManager em = FlightDescription.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM FlightDescription AS o WHERE LOWER(o.destinationCity) LIKE LOWER(:destinationCity)  AND LOWER(o.originCity) LIKE LOWER(:originCity)");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<FlightDescription> q = em.createQuery(queryBuilder.toString(), FlightDescription.class);
        q.setParameter("destinationCity", destinationCity);
        q.setParameter("originCity", originCity);
        return q;
    }
    
}
