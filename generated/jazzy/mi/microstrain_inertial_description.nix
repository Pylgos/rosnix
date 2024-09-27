{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    microstrain_inertial_description-3cdc10c99e3ed5990d3eefa08004aff8f3b03d9e = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-3cdc10c99e3ed5990d3eefa08004aff8f3b03d9e-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "3cdc10c99e3ed5990d3eefa08004aff8f3b03d9e";
        hash = "sha256-lOHPxY9ciFC3/2X7J0UY5DTOJATWSsB7GRP81vSSZRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_description";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_description-3cdc10c99e3ed5990d3eefa08004aff8f3b03d9e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
}
