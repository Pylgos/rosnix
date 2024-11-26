{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_safetyscanners2_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."sick_safetyscanners2_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sick_safetyscanners2_interfaces" = substituteSource {
        src = fetchgit {
          name = "sick_safetyscanners2_interfaces-source";
          url = "https://github.com/ros2-gbp/sick_safetyscanners2_interfaces-release.git";
          rev = "203d6756255f16dd22d8ac5a1012647710403ed2";
          hash = "sha256-FFsjwMwXpIDUcZce2QdkhLAspn9kJgyNkvTQ8UhjUYQ=";
        };
      };
    });
  };
  meta = {
    description = "Interfaces for the sick_safetyscanners ros2 driver";
  };
})
