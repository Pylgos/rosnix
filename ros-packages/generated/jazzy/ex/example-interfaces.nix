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
  version = "0.12.0-3";
  src = finalAttrs.passthru.sources."example_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "example_interfaces" = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "7b504cc01ddad6288771bb716451c6f4f7f6c51d";
        hash = "sha256-mRegvkQKSsJH6SsUNhDlJidkIxKojf6U4GltTKF0oAY=";
      };
    };
  });
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
})
