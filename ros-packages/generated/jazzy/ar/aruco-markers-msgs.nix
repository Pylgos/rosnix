{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_markers_msgs";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."aruco_markers_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_markers_msgs" = substituteSource {
      src = fetchgit {
        name = "aruco_markers_msgs-source";
        url = "https://github.com/namo-robotics/aruco_markers-release.git";
        rev = "a744cee07c8478f1fbcc4add149efd426c0f880e";
        hash = "sha256-UXL+XcbxO9OecUaesNGje4nQIzjGqsoUyuIQksVtUjQ=";
      };
    };
  });
  meta = {
    description = "The aruco_markers_msgs package";
  };
})
