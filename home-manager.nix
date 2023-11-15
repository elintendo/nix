{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.fly = import ./home.nix;
}

