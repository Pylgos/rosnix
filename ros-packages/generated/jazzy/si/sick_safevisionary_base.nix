{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_base-1ab4169f71f6ad75a790b1c8ec712bea04d694d6 = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_base-1ab4169f71f6ad75a790b1c8ec712bea04d694d6-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_base-release.git";
        rev = "1ab4169f71f6ad75a790b1c8ec712bea04d694d6";
        hash = "sha256-EMtEy8XLykxcLHYCPgk6Ralivtfddx0U4aPIsdnxSlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_base";
  version = "1.0.1-3";
  src = sources.sick_safevisionary_base-1ab4169f71f6ad75a790b1c8ec712bea04d694d6;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package provides the basic hardware interface to the SICK Safevisionary sensor";
  };
}
