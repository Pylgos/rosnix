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
  version = "0.14.1-1";
  src = finalAttrs.passthru.sources."example_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "example_interfaces" = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "cba214446cdf7f800721ba15e9fa5497cd06a8f7";
        hash = "sha256-GTLJN0JTfMyjwaFvgy1cAAU3DAXAKwMDwi6RZc8x63I=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
})
