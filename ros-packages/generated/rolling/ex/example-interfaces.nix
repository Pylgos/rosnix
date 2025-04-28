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
  version = "0.14.0-1";
  src = finalAttrs.passthru.sources."example_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "example_interfaces" = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "ad6a1da3f0b07ab24774a96d37c0c99c42a170c0";
        hash = "sha256-JsFuRY0DfoPqwDFTIV36GsAHDXgk8cpWMV2hcKTuzYE=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
})
