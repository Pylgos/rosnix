{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  python_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ament_cmake = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "afe506445d42429c57e0486867d866ab7054a8a0";
        hash = "sha256-5+zwcqUD4kG22oYJie85A8Wl3jxRdcPmkUcQu/nGCFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "3.4.2-2";
  src = sources.launch_testing_ament_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test python_cmake_module ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_test python_cmake_module ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ launch_testing ];
  checkInputs = [ ament_cmake_copyright launch_testing python_cmake_module ];
  missingDependencies = [  ];
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
}
