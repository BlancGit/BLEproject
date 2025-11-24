/*
 * MCUBoot Image to SW Module ID Mapping for nRF5340 TF-M
 *
 * This file provides mapping from MCUBoot image indices to
 * TF-M SW module IDs for proper NSPE attestation.
 */

#ifndef MCUBOOT_IMAGE_SW_MODULE_MAP_H
#define MCUBOOT_IMAGE_SW_MODULE_MAP_H

/* Map MCUBoot images to TF-M SW module IDs */
#define MCUBOOT_BOOT_IMG_TO_SW_MODULE(img_id) \
    ((img_id) == 0 ? SW_SPE : \
     (img_id) == 1 ? SW_NSPE : \
     SW_GENERAL)

#endif /* MCUBOOT_IMAGE_SW_MODULE_MAP_H */
