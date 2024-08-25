{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  assimp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rviz_assimp_vendor = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "e7f5e3c5fa532245b35c1c79d89ba0e4c70c1ee1";
        hash = "sha256-tkqGkBkUAgDU8rZEUlND1z+ve4pSKTDPF41Q/bUwuZc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/assimp/assimp.git";
          to = "VCS_TYPE path VCS_URL ${rviz_assimp_vendor-vendor_source-assimp-0}";
        }
      ];
    };
    rviz_assimp_vendor-vendor_source-assimp-0 = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-vendor_source-assimp-0-source";
        url = "https://github.com/assimp/assimp.git";
        rev = "6a08c39e3a91ef385e76515cfad86aca4bfd57ff";
        hash = "sha256-ResIn+TA/FvrFt5+svMyLCJb2e+lyHFWopHBuzoXAhQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_assimp_vendor";
  version = "14.1.4-1";
  src = sources.rviz_assimp_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around assimp, providing nothing but a dependency on assimp, on some systems. On others, it provides a fixed CMake module or even an ExternalProject build of assimp.";
  };
}
