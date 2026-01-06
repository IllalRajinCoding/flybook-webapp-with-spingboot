package com.flybook.pbo.model;

import java.sql.Timestamp;

public class Tiket {
    private int id;
    private String nomorTiket;
    private String penerbangan;
    private String maskapai;
    private String bandara_asal;
    private String bandara_tujuan;
    private String tanggalBerangkat;
    private String jamBerangkat;
    private String jamTiba;
    private double harga;
    private int kursiTersedia;
    private int kursiTerjual;
    private String status;
    private int userId;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructor
    public Tiket() {
    }

    public Tiket(String nomorTiket, String penerbangan, String maskapai, String bandaraAsal,
                 String bandaraTujuan, String tanggalBerangkat, String jamBerangkat, String jamTiba,
                 double harga, int kursiTersedia) {
        this.nomorTiket = nomorTiket;
        this.penerbangan = penerbangan;
        this.maskapai = maskapai;
        this.bandara_asal = bandaraAsal;
        this.bandara_tujuan = bandaraTujuan;
        this.tanggalBerangkat = tanggalBerangkat;
        this.jamBerangkat = jamBerangkat;
        this.jamTiba = jamTiba;
        this.harga = harga;
        this.kursiTersedia = kursiTersedia;
        this.kursiTerjual = 0;
        this.status = "aktif";
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomorTiket() {
        return nomorTiket;
    }

    public void setNomorTiket(String nomorTiket) {
        this.nomorTiket = nomorTiket;
    }

    public String getPenerbangan() {
        return penerbangan;
    }

    public void setPenerbangan(String penerbangan) {
        this.penerbangan = penerbangan;
    }

    public String getMaskapai() {
        return maskapai;
    }

    public void setMaskapai(String maskapai) {
        this.maskapai = maskapai;
    }

    public String getBandara_asal() {
        return bandara_asal;
    }

    public void setBandara_asal(String bandara_asal) {
        this.bandara_asal = bandara_asal;
    }

    public String getBandara_tujuan() {
        return bandara_tujuan;
    }

    public void setBandara_tujuan(String bandara_tujuan) {
        this.bandara_tujuan = bandara_tujuan;
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

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public int getKursiTersedia() {
        return kursiTersedia;
    }

    public void setKursiTersedia(int kursiTersedia) {
        this.kursiTersedia = kursiTersedia;
    }

    public int getKursiTerjual() {
        return kursiTerjual;
    }

    public void setKursiTerjual(int kursiTerjual) {
        this.kursiTerjual = kursiTerjual;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
