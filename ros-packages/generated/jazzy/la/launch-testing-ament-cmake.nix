{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "launch_testing_ament_cmake" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "afe506445d42429c57e0486867d866ab7054a8a0";
        hash = "sha256-5+zwcqUD4kG22oYJie85A8Wl3jxRdcPmkUcQu/nGCFI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "3.4.2-2";
  src = sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-test python-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ launch-testing ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright launch-testing python-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
}
