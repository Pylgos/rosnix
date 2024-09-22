{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  rosSystemPackages,
  sick_safevisionary_driver,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_tests = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "e9c37f7f15cd26abf44915ba4e5acde30a8ea133";
        hash = "sha256-Q8HR5ihqZXIb5vP+goYKCgxgf635GsyPBnh2t5oPkgI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_tests";
  version = "1.0.3-2";
  src = sources.sick_safevisionary_tests;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ launch launch_ros launch_testing_ament_cmake sick_safevisionary_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integration tests for the Sick SafeVisionary2 driver";
  };
}
