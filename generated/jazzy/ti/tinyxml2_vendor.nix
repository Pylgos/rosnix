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
    tinyxml2_vendor-155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341 = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341";
        hash = "sha256-ptCYnrl38I2LTVvOgSO8OXjxfgGAen17kQSYDOgZZRQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml2_vendor";
  version = "0.9.1-3";
  src = sources.tinyxml2_vendor-155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems. On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.";
  };
}
