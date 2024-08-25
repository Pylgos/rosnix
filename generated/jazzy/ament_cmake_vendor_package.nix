{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  vcstool,
}:
let
  sources = rec {
    ament_cmake_vendor_package = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "97482c1209ed7cf762456a67198edcbfe360e6ea";
        hash = "sha256-KkTE1QQazWtE0GfTss356rNFZaYbrqRkSkq8CMhAeU8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "2.5.2-1";
  src = sources.ament_cmake_vendor_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_test ];
  missingDependencies = [  ];
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
}
