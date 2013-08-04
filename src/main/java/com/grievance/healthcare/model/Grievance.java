/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grievance.healthcare.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;
import java.sql.Timestamp;
import javax.persistence.Lob;

/**
 *
 * @author Anil
 */
@Entity
@Table(name="grievance_details")
public class Grievance implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private Long memberId;
    private Long ssn;
    private String memberName;
    private String requestType;
    private Timestamp requestDate;
    private String email;
    private Long contactNo;
    private String comments;
    private byte[] attachedFile;

    
    
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @Id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "member_id")
    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }
    
    @Column(name = "SSN")
    public Long getSsn() {
        return ssn;
    }

    public void setSsn(Long ssn) {
        this.ssn = ssn;
    }
    

    /**
     * Get the value of name
     *
     * @return the value of name
     */
    @Column(name="member_name")
    public String getMemberName() {
        return memberName;
    }

    /**
     * Set the value of name
     *
     * @param name new value of name
     */
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }


    
//   private enum  RequestType{Appeal,PaymentIssue,Compliant,InsuranceRejection};
    
        
    @Column(name = "request_type")
    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    @Column(name="request_date")
    public Timestamp getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;
    }

    /**
     * Get the value of requestType
     *
     * @return the value of requestType
     */
  /*  public RequestType getRequestType() {
        return requestType;
   */

    /**
     * Set the value of requestType
     *
     * @param requestType new value of requestType
     */
   /* public void setRequestType(RequestType requestType) {
        this.requestType = requestType;
    }*/

    @Column(name="email_id")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="contact_no")
    public Long getContactNo() {
        return contactNo;
    }

    public void setContactNo(Long contactNo) {
        this.contactNo = contactNo;
    }
   
    

    /**
     * Get the value of comments
     *
     * @return the value of comments
     */
    @Column(name = "comments")
    public String getComments() {
        return comments;
    }

    /**
     * Set the value of comments
     *
     * @param comments new value of comments
     */
    public void setComments(String comments) {
        this.comments = comments;

    }

/**
     * Get the value of comments
     *
     * @return the value of comments
     */
    @Lob
    @Column(name="file", columnDefinition="mediumblob")
    public byte[] getAttachedFile() {
        return attachedFile;
    }

    /**
     * Set the value of comments
     *
     * @param comments new value of comments
     */
    public void setAttachedFile(byte[] attachedFile) {
        this.attachedFile = attachedFile;

    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (memberId != null ? memberId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Grievance)) {
            return false;
        }
        Grievance other = (Grievance) object;
        if ((this.memberId == null && other.memberId != null) || (this.memberId != null && !this.memberId.equals(other.memberId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.grievance.healthcare.model.Grievance[ id=" + memberId + " ]";
    }


}
