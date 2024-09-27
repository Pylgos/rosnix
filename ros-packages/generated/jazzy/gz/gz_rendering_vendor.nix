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
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_ogre_next_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_rendering-vendor_source-8a547d5386a33789313abbb5bbbe1b2ec4c04741 = substituteSource {
      src = fetchgit {
        name = "gz_rendering-vendor_source-8a547d5386a33789313abbb5bbbe1b2ec4c04741-source";
        url = "https://github.com/gazebosim/gz-rendering.git";
        rev = "8a547d5386a33789313abbb5bbbe1b2ec4c04741";
        hash = "sha256-eaWkZKHu566Rub7YSO2lnKdj8YQbhl86v+JR4zrgtjs=";
      };
      substitutions = [
      ];
    };
    gz_rendering_vendor-0311a31fd962c26af668bc0d1cc83e9aa3d32417 = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-0311a31fd962c26af668bc0d1cc83e9aa3d32417-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "0311a31fd962c26af668bc0d1cc83e9aa3d32417";
        hash = "sha256-HfhzPI6ahnABY8PpXwl6szZ4P7VGjjGp1X2+KkbdTEc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_rendering-vendor_source-8a547d5386a33789313abbb5bbbe1b2ec4c04741}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_rendering_vendor";
  version = "0.0.4-1";
  src = sources.gz_rendering_vendor-0311a31fd962c26af668bc0d1cc83e9aa3d32417;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_ogre_next_vendor gz_plugin_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "glut" "gz-rendering8" "libfreeimage-dev" "libglew-dev" "libogre-dev" "libvulkan-dev" "libxi-dev" "libxmu-dev" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xvfb" ]; };
  meta = {
    description = "Vendor package for: gz-rendering8 8.2.0 Gazebo Rendering: Rendering library for robot applications";
  };
}
