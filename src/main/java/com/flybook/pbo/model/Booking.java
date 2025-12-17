package com.flybook.pbo.model;

import java.sql.Timestamp;

public class Booking {

    private int id;
    private String bookingCode;
    private int tiketId;
    private String userName;
    private int jumlahKursi;
    private double totalHarga;
    private String status; // pending, success, failed
    private Timestamp tanggalBooking;
    private Timestamp updatedAt;

    // Untuk join dengan tabel tiket
    private String nomorTiket;
    private String maskapai;
    private String penerbangan;
    private String bandaraAsal;
    private String bandaraTujuan;
    private String tanggalBerangkat;
    private String jamBerangkat;
    private String jamTiba;

    // Constructors
    public Booking() {
    }

    public Booking(String bookingCode, int tiketId, String userName, int jumlahKursi, double totalHarga) {
        this.bookingCode = bookingCode;
        this.tiketId = tiketId;
        this.userName = userName;
        this.jumlahKursi = jumlahKursi;
        this.totalHarga = totalHarga;
        this.status = "pending";
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookingCode() {
        return bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
    }

    public int getTiketId() {
        return tiketId;
    }

    public void setTiketId(int tiketId) {
        this.tiketId = tiketId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getJumlahKursi() {
        return jumlahKursi;
    }

    public void setJumlahKursi(int jumlahKursi) {
        this.jumlahKursi = jumlahKursi;
    }

    public double getTotalHarga() {
        return totalHarga;
    }

    public void setTotalHarga(double totalHarga) {
        this.totalHarga = totalHarga;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTanggalBooking() {
        return tanggalBooking;
    }

    public void setTanggalBooking(Timestamp tanggalBooking) {
        this.tanggalBooking = tanggalBooking;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Join fields getters/setters
    public String getNomorTiket() {
        return nomorTiket;
    }

    public void setNomorTiket(String nomorTiket) {
        this.nomorTiket = nomorTiket;
    }

    public String getMaskapai() {
        return maskapai;
    }

    public void setMaskapai(String maskapai) {
        this.maskapai = maskapai;
    }

    public String getPenerbangan() {
        return penerbangan;
    }

    public void setPenerbangan(String penerbangan) {
        this.penerbangan = penerbangan;
    }

    public String getBandaraAsal() {
        return bandaraAsal;
    }

    public void setBandaraAsal(String bandaraAsal) {
        this.bandaraAsal = bandaraAsal;
    }

    public String getBandaraTujuan() {
        return bandaraTujuan;
    }

    public void setBandaraTujuan(String bandaraTujuan) {
        this.bandaraTujuan = bandaraTujuan;
    }

    public String getTanggalBerangkat() {
        return tanggalBerangkat;
    }

    public void setTanggalBerangkat(String tanggalBerangkat) {
        this.tanggalBerangkat = tanggalBerangkat;
    }

    public String getJamBerangkat() {
        return jamBerangkat;
    }

    public void setJamBerangkat(String jamBerangkat) {
        this.jamBerangkat = jamBerangkat;
    }

    public String getJamTiba() {
        return jamTiba;
    }

    public void setJamTiba(String jamTiba) {
        this.jamTiba = jamTiba;
    }
}
