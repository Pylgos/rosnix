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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."shape_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "shape_msgs" = substituteSource {
        src = fetchgit {
          name = "shape_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "5545d982b0b9cfdbde6c70829b8f00eaa662f593";
          hash = "sha256-UKKhif5/czNgGji/N04V6bJhlToIqdDTMGeAbf3PW5A=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
})
