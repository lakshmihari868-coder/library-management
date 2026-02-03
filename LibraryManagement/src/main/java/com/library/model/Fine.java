package com.library.model;

import java.util.Date;

public class Fine {
    private int issueId;
    private String username;
    private String bookTitle;
    private Date dueDate;
    private Date returnDate;
    private int overdueDays;
    private double fineAmount;

    // Constructor
    public Fine() {}

    public Fine(int issueId, String username, String bookTitle, Date dueDate, Date returnDate, int overdueDays, double fineAmount) {
        this.issueId = issueId;
        this.username = username;
        this.bookTitle = bookTitle;
        this.dueDate = dueDate;
        this.returnDate = returnDate;
        this.overdueDays = overdueDays;
        this.fineAmount = fineAmount;
    }

    // Getters and setters
    public int getIssueId() { return issueId; }
    public void setIssueId(int issueId) { this.issueId = issueId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    public Date getDueDate() { return dueDate; }
    public void setDueDate(Date dueDate) { this.dueDate = dueDate; }

    public Date getReturnDate() { return returnDate; }
    public void setReturnDate(Date returnDate) { this.returnDate = returnDate; }

    public int getOverdueDays() { return overdueDays; }
    public void setOverdueDays(int overdueDays) { this.overdueDays = overdueDays; }

    public double getFineAmount() { return fineAmount; }
    public void setFineAmount(double fineAmount) { this.fineAmount = fineAmount; }
}

