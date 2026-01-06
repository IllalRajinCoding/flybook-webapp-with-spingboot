package com.flybook.pbo.service;

import com.flybook.pbo.model.Tiket;
import com.flybook.pbo.repository.TiketRepository;
import java.util.List;


public class TiketService {

    /**
     * Create new tiket
     */
    public static boolean tambahTiket(Tiket tiket) {
        if (tiket.getNomorTiket() == null || tiket.getNomorTiket().isEmpty()) {
            return false;
        }
        if (tiket.getMaskapai() == null || tiket.getMaskapai().isEmpty()) {
            return false;
        }
        return TiketRepository.create(tiket);
    }

    /**
     * Get all tiket
     */
    public static List<Tiket> semuaTiket() {
        return TiketRepository.getAll();
    }

    /**
     * Get tiket by ID
     */
    public static Tiket getTiketById(int id) {
        return TiketRepository.getById(id);
    }

    /**
     * Update tiket
     */
    public static boolean updateTiket(Tiket tiket) {
        if (tiket.getId() <= 0) {
            return false;
        }
        return TiketRepository.update(tiket);
    }

    /**
     * Delete tiket
     */
    public static boolean hapusTiket(int id) {
        return TiketRepository.delete(id);
    }

    /**
     * Get available seats
     */
    public static int getAvailableSeats(int tiketId) {
        Tiket tiket = TiketRepository.getById(tiketId);
        if (tiket != null) {
            return tiket.getKursiTersedia() - tiket.getKursiTerjual();
        }
        return 0;
    }

    /**
     * Update seat availability
     */
    public static boolean updateSeats(int tiketId, int seatsToBook) {
        Tiket tiket = TiketRepository.getById(tiketId);
        if (tiket != null) {
            int availableSeats = tiket.getKursiTersedia() - tiket.getKursiTerjual();
            if (availableSeats >= seatsToBook) {
                tiket.setKursiTerjual(tiket.getKursiTerjual() + seatsToBook);
                return TiketRepository.update(tiket);
            }
        }
        return false;
    }
}
