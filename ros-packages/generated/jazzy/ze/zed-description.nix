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
  version = "0.1.3-1";
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
        rev = "9eb427a486a3a035eb9ea3420fe64d0c119f0e92";
        hash = "sha256-UQdS6NYrnASDTDdeMvTd70E7gVLOGso4iAc9OWpV7ss=";
      };
    };
  });
  meta = {
    description = "Contains URDF and meshes to create models of Stereolabs ZED Cameras.";
  };
})
