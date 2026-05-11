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
  version = "5.10.0-1";
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
        rev = "322b792e74627e0a92cb5f19cc240272d281c083";
        hash = "sha256-R1+oZabCMHNctGG93bJlS+NeDX45xpP32u7IcqF1pIk=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
})
