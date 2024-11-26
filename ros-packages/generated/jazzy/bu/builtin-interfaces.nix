{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "builtin_interfaces";
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."builtin_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "builtin_interfaces" = substituteSource {
        src = fetchgit {
          name = "builtin_interfaces-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "77d0c5db6fc502b0d44926e2a852b8149eebe704";
          hash = "sha256-4Sz8x27mOS78Aif3y3nIoUnZ7MZNlGI2m1qqluPKoG8=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
})
