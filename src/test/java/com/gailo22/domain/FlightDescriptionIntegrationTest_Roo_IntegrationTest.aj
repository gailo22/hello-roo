// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.domain;

import com.gailo22.domain.FlightDescription;
import com.gailo22.domain.FlightDescriptionDataOnDemand;
import com.gailo22.domain.FlightDescriptionIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FlightDescriptionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FlightDescriptionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FlightDescriptionIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FlightDescriptionIntegrationTest: @Transactional;
    
    @Autowired
    FlightDescriptionDataOnDemand FlightDescriptionIntegrationTest.dod;
    
    @Test
    public void FlightDescriptionIntegrationTest.testCountFlightDescriptions() {
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", dod.getRandomFlightDescription());
        long count = FlightDescription.countFlightDescriptions();
        Assert.assertTrue("Counter for 'FlightDescription' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testFindFlightDescription() {
        FlightDescription obj = dod.getRandomFlightDescription();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", obj);
        Long id = obj.getFlightDescId();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to provide an identifier", id);
        obj = FlightDescription.findFlightDescription(id);
        Assert.assertNotNull("Find method for 'FlightDescription' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'FlightDescription' returned the incorrect identifier", id, obj.getFlightDescId());
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testFindAllFlightDescriptions() {
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", dod.getRandomFlightDescription());
        long count = FlightDescription.countFlightDescriptions();
        Assert.assertTrue("Too expensive to perform a find all test for 'FlightDescription', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<FlightDescription> result = FlightDescription.findAllFlightDescriptions();
        Assert.assertNotNull("Find all method for 'FlightDescription' illegally returned null", result);
        Assert.assertTrue("Find all method for 'FlightDescription' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testFindFlightDescriptionEntries() {
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", dod.getRandomFlightDescription());
        long count = FlightDescription.countFlightDescriptions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<FlightDescription> result = FlightDescription.findFlightDescriptionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'FlightDescription' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'FlightDescription' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testFlush() {
        FlightDescription obj = dod.getRandomFlightDescription();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", obj);
        Long id = obj.getFlightDescId();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to provide an identifier", id);
        obj = FlightDescription.findFlightDescription(id);
        Assert.assertNotNull("Find method for 'FlightDescription' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFlightDescription(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'FlightDescription' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testMergeUpdate() {
        FlightDescription obj = dod.getRandomFlightDescription();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", obj);
        Long id = obj.getFlightDescId();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to provide an identifier", id);
        obj = FlightDescription.findFlightDescription(id);
        boolean modified =  dod.modifyFlightDescription(obj);
        Integer currentVersion = obj.getVersion();
        FlightDescription merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getFlightDescId(), id);
        Assert.assertTrue("Version for 'FlightDescription' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", dod.getRandomFlightDescription());
        FlightDescription obj = dod.getNewTransientFlightDescription(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'FlightDescription' identifier to be null", obj.getFlightDescId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'FlightDescription' identifier to no longer be null", obj.getFlightDescId());
    }
    
    @Test
    public void FlightDescriptionIntegrationTest.testRemove() {
        FlightDescription obj = dod.getRandomFlightDescription();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to initialize correctly", obj);
        Long id = obj.getFlightDescId();
        Assert.assertNotNull("Data on demand for 'FlightDescription' failed to provide an identifier", id);
        obj = FlightDescription.findFlightDescription(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'FlightDescription' with identifier '" + id + "'", FlightDescription.findFlightDescription(id));
    }
    
}
