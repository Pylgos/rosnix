{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  freeglut,
  glew,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_ogre_next_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  substituteSource,
  util-linux,
  vulkan-loader,
  xorg,
}:
let
  sources = rec {
    gz_rendering_vendor = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "0311a31fd962c26af668bc0d1cc83e9aa3d32417";
        hash = "sha256-HfhzPI6ahnABY8PpXwl6szZ4P7VGjjGp1X2+KkbdTEc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_rendering_vendor-vendor_source-gz-rendering-0}";
        }
      ];
    };
    gz_rendering_vendor-vendor_source-gz-rendering-0 = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-vendor_source-gz-rendering-0-source";
        url = "https://github.com/gazebosim/gz-rendering.git";
        rev = "8a547d5386a33789313abbb5bbbe1b2ec4c04741";
        hash = "sha256-eaWkZKHu566Rub7YSO2lnKdj8YQbhl86v+JR4zrgtjs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_rendering_vendor";
  version = "0.0.4-1";
  src = sources.gz_rendering_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_utils_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freeglut glew gz_common_vendor gz_ogre_next_vendor gz_plugin_vendor util-linux vulkan-loader xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint xorg.xorgserver ];
  missingDependencies = [ "gz-rendering8" "libfreeimage-dev" ];
  meta = {
    description = "Vendor package for: gz-rendering8 8.2.0 Gazebo Rendering: Rendering library for robot applications";
  };
}
