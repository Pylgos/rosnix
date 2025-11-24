{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "rosapi_msgs";
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."rosapi_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi_msgs" = substituteSource {
      src = fetchgit {
        name = "rosapi_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "d3d947345925194fdc224bb874f75b5b77248dd2";
        hash = "sha256-nELqPjHbD/eV4kqB4a0QBe05IJziaavOcurKSe7k6Ss=";
      };
    };
  });
  meta = {
    description = "Interface definitions for rosapi package.";
  };
})
