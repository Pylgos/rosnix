{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zed_description";
  version = "0.1.5-1";
  src = finalAttrs.passthru.sources."zed_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-auto rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto rviz2 xacro ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "zed_description" = substituteSource {
      src = fetchgit {
        name = "zed_description-source";
        url = "https://github.com/ros2-gbp/zed-ros2-description-release.git";
        rev = "1123c4250704e60e6fad08741ba99cd65e69fc66";
        hash = "sha256-B0Bp8YNV4UIAACxftx8sMs0jEKePWvyEwRJX+8pvXVA=";
      };
    };
  });
  meta = {
    description = "Contains URDF and meshes to create models of Stereolabs ZED Cameras.";
  };
})
