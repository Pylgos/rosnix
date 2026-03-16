{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf-test,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "human_description";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."human_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ launch launch-pal launch-param-builder launch-ros xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ launch launch-pal launch-param-builder launch-ros xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common launch-testing-ament-cmake robot-state-publisher urdf-test ];
  passthru.sources = mkSourceSet (sources: {
    "human_description" = substituteSource {
      src = fetchgit {
        name = "human_description-source";
        url = "https://github.com/ros4hri/human_description-release.git";
        rev = "b0835ffe56582ae02d6270a3607cde61b29cef68";
        hash = "sha256-qKZ/Ym6+oLJmYECE6OClZuKKhi4uMU0GptbQwAOzcHs=";
      };
    };
  });
  meta = {
    description = "\n        This package contains a parametric kinematic description of humans. \n        The files in this package are parsed and used by a variety of other \n        components, notably in the context of human-robot interaction.\n        Most users will not interact directly with this package.\n    ";
  };
})
