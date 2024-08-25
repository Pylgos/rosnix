{
  ament_cmake,
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
    fastrtps_cmake_module = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "d3265cdbcaad3096098474edb966fd17eb5a977f";
        hash = "sha256-CMvgUlOB5CpgyTkKXPsg5gTBnHHJWz1DLOwjQRe/UDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps_cmake_module";
  version = "3.6.0-2";
  src = sources.fastrtps_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
}
