export type Menu = {
    id: number;
    title: string;
    icon?: any;
    path?: string;
    newTab: boolean;
    submenu?: Menu[];
};
  