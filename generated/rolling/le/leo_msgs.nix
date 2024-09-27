{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    leo_msgs-2c43fcac7fbd2eb73a20aaa6cfb273b60ed0aa89 = substituteSource {
      src = fetchgit {
        name = "leo_msgs-2c43fcac7fbd2eb73a20aaa6cfb273b60ed0aa89-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "2c43fcac7fbd2eb73a20aaa6cfb273b60ed0aa89";
        hash = "sha256-sXiMSsfTjgdxjO/akTTMgVO9nP50z0mfvcJP242J2tk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_msgs";
  version = "3.0.3-1";
  src = sources.leo_msgs-2c43fcac7fbd2eb73a20aaa6cfb273b60ed0aa89;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message and Service definitions for Leo Rover";
  };
}
