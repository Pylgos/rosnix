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
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zed_msgs";
  version = "5.0.1-2";
  src = finalAttrs.passthru.sources."zed_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime shape-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime shape-msgs std-msgs ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "zed_msgs" = substituteSource {
      src = fetchgit {
        name = "zed_msgs-source";
        url = "https://github.com/ros2-gbp/zed-ros2-interfaces-release.git";
        rev = "305cfa6e73d7ca8cd92ee289e0824852cd02dd32";
        hash = "sha256-zi/Zzi60tKl2zYUBqEAxynUAszgRTMgk/FNaeHV6zTQ=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the ZED ROS2 nodes.";
  };
})
