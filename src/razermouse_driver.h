/*
 * Razer Kernel Drivers
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef __HID_RAZER_MOUSE_H
#define __HID_RAZER_MOUSE_H


//#################//
//### Constants ###//
//#################//

#define USB_DEVICE_ID_RAZER_MAMBA 0x0045
#define USB_DEVICE_ID_RAZER_ABYSSUS 0x0042

#define RAZER_MAMBA_ROW_LEN 15

#define RAZER_MOUSE_WAIT_MIN_US 600
#define RAZER_MOUSE_WAIT_MAX_US 800



//#############//
//### Types ###//
//#############//

struct razer_mouse_device {
    struct usb_device *usbdev;
    struct hid_device *hiddev;
    unsigned char effect;
    char name[128];
    char phys[64];
};

#endif
