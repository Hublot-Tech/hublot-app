import { Menu } from "@/types/menu";

const root = "/cservice";

export const menuData: Menu[] = [
    {
        id: 1,
        title: "Dashboard",
        icon: "dashboard",
        path: root+"/Dashboard",
        newTab: false,
    },
    {
        id: 2,
        title: "Customers",
        icon: "people",
        path: root+"/Customers",
        newTab: false,
    },
    {
        id: 3,
        title: "Chat",
        icon: "chat",
        path: root+"/Chat",
        newTab: false,
    },
    { 
        id: 4,
        title: "Email",
        icon: "email",
        path: root+"/Email",
        newTab: false,
    },
    {
        id: 5,
        title: "Settings",
        icon: "settings",
        path: root+"/Settings",
        newTab: false,
    },
    {
        id: 6,
        title: "Help",
        icon: "help",
        path: root+"/Help",
        newTab: false,
    },
];