{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cx-bringup,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_tutorial_agents";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_tutorial_agents";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-bringup ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_tutorial_agents" = substituteSource {
      src = fetchgit {
        name = "cx_tutorial_agents-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "0ad8cf2b65e3ca089a631ac184c5bc2ef779d339";
        hash = "sha256-rZemtIt5qLzx0w7Esfoh+LAgB7PU6YIUxr/JLkxLPRE=";
      };
    };
  });
  meta = {
    description = "Files used in the agent tutorials";
  };
})
