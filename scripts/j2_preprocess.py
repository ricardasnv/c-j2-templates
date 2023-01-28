import jinja2 as j2
import os

def j2_preprocess(template_path, variables):
    assert type(template_path) == str
    assert type(variables) == dict

    template_filename = os.path.basename(template_path)
    template_dir = os.path.dirname(template_path)

    j2loader = j2.FileSystemLoader(template_dir)
    j2env = j2.Environment(loader=j2loader)
    j2template = j2env.get_template(template_filename)

    return j2template.render(variables)

