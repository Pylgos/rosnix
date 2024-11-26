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
  soccer-vision-attribute-msgs,
  substituteSource,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_vision_3d_msgs";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."soccer_vision_3d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime soccer-vision-attribute-msgs vision-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "soccer_vision_3d_msgs" = substituteSource {
        src = fetchgit {
          name = "soccer_vision_3d_msgs-source";
          url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
          rev = "53e5c907b54c8767acd236cc367a537656904b95";
          hash = "sha256-mefLwquylSQ8WewNihJ2SMPAIUXP2T1Ye+Q7n9q7b8c=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some 3D vision related message definitions in the soccer domain.";
  };
})
