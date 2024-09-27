{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_console" = substituteSource {
      src = fetchgit {
        name = "ecl_console-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "8ae020da4280c2a5035e07302d4bb15e2e59a78b";
        hash = "sha256-w1XZlDsjZDQ0MPDG+dhU0mD3KZjRt4yslxJCP5RHeTE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_console";
  version = "1.2.0-5";
  src = sources."ecl_console";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Color codes for ansii consoles.";
  };
}
