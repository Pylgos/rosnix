{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_interface = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "6311df134f65a3fb5b1a8a8666b77b9947087843";
        hash = "sha256-ppGJYEONVip3/7Cr7zw5Su52mfxFT7EhDttXmwEFUt4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_interface";
  version = "4.6.3-1";
  src = sources.rosidl_typesupport_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The interface for rosidl typesupport packages.";
  };
}
