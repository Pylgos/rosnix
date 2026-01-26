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
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zed_description";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."zed_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto rviz2 xacro ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "zed_description" = substituteSource {
      src = fetchgit {
        name = "zed_description-source";
        url = "https://github.com/ros2-gbp/zed-ros2-description-release.git";
        rev = "4b37d7f789bbd25cba9b44dd041ac1a3dd2ddfc6";
        hash = "sha256-vesJ7HN4LNxQHmmpwY1WtNWZDk8ykMx0Jmnq/XGBJh8=";
      };
    };
  });
  meta = {
    description = "Contains URDF and meshes to create models of Stereolabs ZED Cameras.";
  };
})
