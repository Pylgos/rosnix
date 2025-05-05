{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "shape_msgs";
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."shape_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "shape_msgs" = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "48c757b450ef18fa36318feb23d61a7b4fa980a9";
        hash = "sha256-2wUoYe8EiAEc2ywpMLB60GOtyBKXZ7gyHJzs0y75Z74=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
})
