// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.domain;

import com.gailo22.domain.Booking;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Booking_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Booking.entityManager;
    
    public static final List<String> Booking.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "email", "flight");
    
    public static final EntityManager Booking.entityManager() {
        EntityManager em = new Booking().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Booking.countBookings() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Booking o", Long.class).getSingleResult();
    }
    
    public static List<Booking> Booking.findAllBookings() {
        return entityManager().createQuery("SELECT o FROM Booking o", Booking.class).getResultList();
    }
    
    public static List<Booking> Booking.findAllBookings(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Booking o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Booking.class).getResultList();
    }
    
    public static Booking Booking.findBooking(Long bookingId) {
        if (bookingId == null) return null;
        return entityManager().find(Booking.class, bookingId);
    }
    
    public static List<Booking> Booking.findBookingEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Booking o", Booking.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Booking> Booking.findBookingEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Booking o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Booking.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Booking.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Booking.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Booking attached = Booking.findBooking(this.bookingId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Booking.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Booking.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Booking Booking.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Booking merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
