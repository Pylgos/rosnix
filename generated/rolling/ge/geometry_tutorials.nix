{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    geometry_tutorials-e5a64a1b195d49794093248bdf3f7bdb8d64e50c = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-e5a64a1b195d49794093248bdf3f7bdb8d64e50c-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "e5a64a1b195d49794093248bdf3f7bdb8d64e50c";
        hash = "sha256-pKGL96jK4+eJOdLsryPMZOhHrsfCeS5TARr8qQeRhPI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_tutorials";
  version = "0.6.2-1";
  src = sources.geometry_tutorials-e5a64a1b195d49794093248bdf3f7bdb8d64e50c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
}
