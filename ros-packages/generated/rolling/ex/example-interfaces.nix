{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "example_interfaces";
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."example_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "example_interfaces" = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "368ac34d464d3bf9a41f0ba57b4e620015ee41fe";
        hash = "sha256-ml5g868RTSdeF+Sf56Ed0C3LWMU+G7I+cnQY3Jc83Bc=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
})
